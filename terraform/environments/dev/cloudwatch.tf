module "cloudwatch" {
  source = "../../modules/cloudwatch"

    function_name = module.get_lambda.lambda_function_name
    tags = {
      Environment = "dev"
      Project     = "serverless-platform"
      ManagedBy   = "Terraform"
    }   
}
