resource "aws_amplify_app" "frontend_application" {

  name         = var.app_name
  repository   = var.github_repository
  access_token = var.github_access_token
  # iam_service_role_arn = var.amplify_service_role

  build_spec = var.frontend_build_spec

  enable_auto_branch_creation = false

  tags = var.tags
}


# # Create Amplify branch for main branch
# resource "aws_amplify_branch" "main_branch" {

#   app_id      = aws_amplify_app.frontend_application.id
#   branch_name = var.branch_name

#   framework = "Web"

#   stage = "PRODUCTION"

#   enable_auto_build = true
# }


