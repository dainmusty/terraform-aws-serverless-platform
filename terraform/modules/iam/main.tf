data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  tags = var.tags
}


# Cloudwatch and DynamoDB permissions for Lambda execution role
data "aws_iam_policy_document" "lambda_permissions_policy_document" {

  statement {
    sid    = "CloudWatchLogsAccess"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    sid    = "DynamoDBAccess"
    effect = "Allow"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:Scan",
      "dynamodb:Query"
    ]

    resources = [
      var.dynamodb_table_arn
    ]
  }
}


resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name        = "${var.role_name}-policy"
  description = "IAM policy for Lambda DynamoDB access"

  policy = data.aws_iam_policy_document.lambda_permissions_policy_document.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
}



 # IAM role for Amplify service
resource "aws_iam_role" "amplify_service_role" {

  name = "${var.app_name}-amplify-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tags
}



resource "aws_iam_role_policy_attachment" "amplify_policy_attachment" {

  role = aws_iam_role.amplify_service_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

resource "aws_iam_role_policy" "amplify-policy" {
  name = "${var.app_name}-amplify-policy"
  role = aws_iam_role.amplify_service_role.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup",
          "logs:DescribeLogGroups",
          "codecommit:GitPull"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}