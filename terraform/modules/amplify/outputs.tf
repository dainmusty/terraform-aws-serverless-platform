output "amplify_app_id" {
  description = "Amplify App ID"
  value       = aws_amplify_app.frontend_application.id
}

output "amplify_default_domain" {
  description = "Amplify default domain"
  value       = aws_amplify_app.frontend_application.default_domain
}


