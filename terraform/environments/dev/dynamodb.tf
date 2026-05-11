module "dynamodb" {
  source = "../../modules/dynamodb"

  table_name    = "Student-Details"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "studentId"
  hash_key_type = "S"

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}