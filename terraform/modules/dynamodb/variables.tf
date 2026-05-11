variable "table_name" {
  description = "Name of DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Partition key"
  type        = string
}

variable "hash_key_type" {
  description = "Partition key type"
  type        = string
  default     = "S"
}

variable "sort_key" {
  description = "Sort key"
  type        = string
  default     = null
}

variable "sort_key_type" {
  description = "Sort key type"
  type        = string
  default     = "S"
}

variable "tags" {
  description = "Tags for DynamoDB table"
  type        = map(string)
  default     = {}
}