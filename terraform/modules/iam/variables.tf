variable "role_name" {
  description = "IAM role name for Lambda"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "DynamoDB table ARN"
  type        = string
}

variable "tags" {
  description = "Tags for IAM resources"
  type        = map(string)
  default     = {}
}