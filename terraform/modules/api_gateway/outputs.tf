output "api_gateway_id" {
  description = "API Gateway ID"
  value       = aws_apigatewayv2_api.http_api_gateway.id
}

output "api_gateway_endpoint" {
  description = "API Gateway endpoint"
  value       = aws_apigatewayv2_api.http_api_gateway.api_endpoint
}

output "api_gateway_execution_arn" {
  description = "API Gateway execution ARN"
  value       = aws_apigatewayv2_api.http_api_gateway.execution_arn
}

