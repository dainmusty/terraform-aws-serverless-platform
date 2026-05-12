module "get_lambda" {

  source = "../../modules/lambda"

  function_name      = "get-student-data"
  lambda_source_path = "../../../lambda/get-function"

  runtime = "python3.12"
  handler = "GETmethod.lambda_handler"

  lambda_role_arn = module.iam.lambda_role_arn

  environment_variables = {
    TABLE_NAME = module.dynamodb.table_name
  }

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}