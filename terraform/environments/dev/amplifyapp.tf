module "amplify" {

  source = "../../modules/amplify"

  app_name = "serverless-student-portal"

  github_repository = "https://github.com/dainmusty/terraform-aws-serverless-platform.git"

  github_access_token = var.github_access_token

  # amplify_service_role = module.iam.amplify_service_role_arn

  branch_name = "main"

  frontend_build_spec = <<EOF
version: 1
frontend:
  phases:
    build:
      commands:
        - echo "Static frontend deployment"
  artifacts:
    baseDirectory: frontend
    files:
      - '**/*'
EOF

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}