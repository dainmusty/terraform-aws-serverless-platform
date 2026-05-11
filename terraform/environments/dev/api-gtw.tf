module "api_gateway" {

  source = "../../modules/api_gateway"

  api_name = "serverless-student-api"

  lambda_routes = {

    getStudentData = {
      route_key            = "GET /students"
      lambda_function_arn  = module.get_lambda.lambda_function_arn
      lambda_invoke_arn    = module.get_lambda.lambda_invoke_arn
      lambda_function_name = module.get_lambda.lambda_function_name
    }

    putStudentData = {
      route_key            = "POST /students"
      lambda_function_arn  = module.put_lambda.lambda_function_arn
      lambda_invoke_arn    = module.put_lambda.lambda_invoke_arn
      lambda_function_name = module.put_lambda.lambda_function_name
    }
  }

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}

