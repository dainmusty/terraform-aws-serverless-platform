output "lambda_role_arn" {
  description = "Lambda execution role ARN"
  value       = aws_iam_role.lambda_execution_role.arn
}

output "lambda_role_name" {
  description = "Lambda execution role name"
  value       = aws_iam_role.lambda_execution_role.name
}

# output "amplify_service_role_arn" {
#   description = "Amplify service role ARN"
#   value       = aws_iam_role.amplify_service_role.arn
# }