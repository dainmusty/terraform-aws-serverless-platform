variable "api_name" {
  description = "API Gateway name"
  type        = string
}

variable "lambda_routes" {
  description = "Map of Lambda routes"

  type = map(object({
    route_key           = string
    lambda_function_arn = string
    lambda_invoke_arn   = string
    lambda_function_name = string
  }))
}

variable "tags" {
  description = "Tags for API Gateway resources"
  type        = map(string)
  default     = {}
}