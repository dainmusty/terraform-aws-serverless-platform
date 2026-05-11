module "iam" {
  source = "../../modules/iam"

  role_name         = "serverless-lambda-role"
  dynamodb_table_arn = module.dynamodb.table_arn

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}