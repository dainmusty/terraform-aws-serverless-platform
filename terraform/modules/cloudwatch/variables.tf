variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "tags" {
  description = "Tags for Lambda resources"
  type        = map(string)
  default     = {}
}