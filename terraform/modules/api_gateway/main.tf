resource "aws_apigatewayv2_api" "http_api_gateway" {

  name          = var.api_name
  protocol_type = "HTTP"

  tags = var.tags
}


resource "aws_apigatewayv2_integration" "lambda_integrations" {

  for_each = var.lambda_routes

  api_id = aws_apigatewayv2_api.http_api_gateway.id

  integration_type       = "AWS_PROXY"
  integration_uri        = each.value.lambda_invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

# Create API Gateway routes for each Lambda function
resource "aws_apigatewayv2_route" "api_routes" {

  for_each = var.lambda_routes

  api_id = aws_apigatewayv2_api.http_api_gateway.id

  route_key = each.value.route_key

  target = "integrations/${aws_apigatewayv2_integration.lambda_integrations[each.key].id}"
}


# Create a default stage for the API Gateway
resource "aws_apigatewayv2_stage" "default_stage" {

  api_id = aws_apigatewayv2_api.http_api_gateway.id

  name        = "$default"
  auto_deploy = true

  tags = var.tags
}


# Grant API Gateway permission to invoke the Lambda functions
resource "aws_lambda_permission" "api_gateway_lambda_permissions" {

  for_each = var.lambda_routes

  statement_id = "AllowExecutionFromAPIGateway-${each.key}"

  action = "lambda:InvokeFunction"

  function_name = each.value.lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.http_api_gateway.execution_arn}/*/*"
}


