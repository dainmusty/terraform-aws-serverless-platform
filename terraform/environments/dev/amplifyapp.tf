module "amplify" {

  source = "../../modules/amplify"

  app_name = "serverless-student-portal"

  github_repository = "https://github.com/dainmusty/terraform-aws-serverless-platform.git"

  github_access_token = var.github_access_token


  get_student_api_url  = "${module.api_gateway.api_gateway_endpoint}/students"
  post_student_api_url = "${module.api_gateway.api_gateway_endpoint}/students"

  # amplify_service_role = module.iam.amplify_service_role_arn, will work on it later

  branch_name = "main"

  frontend_build_spec = <<EOF
version: 1

frontend:
  phases:
    preBuild:
      commands:
        - echo "Preparing frontend build"
        - sed -i "s|__GET_API__|$GET_API|g" Frontend/js/config.js
        - sed -i "s|__POST_API__|$POST_API|g" Frontend/js/config.js

    build:
      commands:
        - echo "Deploying static frontend"

  artifacts:
    baseDirectory: Frontend
    files:
      - '**/*'

  cache:
    paths: []
EOF

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}

