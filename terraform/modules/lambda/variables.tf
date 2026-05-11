variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_source_path" {
  description = "Path to Lambda source code"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.12"
}

variable "handler" {
  description = "Lambda handler"
  type        = string
  default     = "index.lambda_handler"
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "timeout" {
  description = "Lambda timeout"
  type        = number
  default     = 10
}

variable "memory_size" {
  description = "Lambda memory size"
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Lambda environment variables"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags for Lambda resources"
  type        = map(string)
  default     = {}
}