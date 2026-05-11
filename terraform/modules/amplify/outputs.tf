output "amplify_app_id" {
  description = "Amplify App ID"
  value       = aws_amplify_app.frontend_application.id
}

output "amplify_default_domain" {
  description = "Amplify default domain"
  value       = aws_amplify_app.frontend_application.default_domain
}

# output "amplify_app_url" {
#   description = "Amplify application URL"

#   value = "https://${aws_amplify_branch.main_branch.branch_name}.${aws_amplify_app.frontend_application.default_domain}"
# }


