resource "aws_lambda_function" "lambda_function" {

  function_name = var.function_name

  role    = var.lambda_role_arn
  runtime = var.runtime
  handler = var.handler

  filename         = data.archive_file.lambda_zip_archive.output_path
  source_code_hash = data.archive_file.lambda_zip_archive.output_base64sha256

  timeout     = var.timeout
  memory_size = var.memory_size

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}

