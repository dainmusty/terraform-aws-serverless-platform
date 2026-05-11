# DynamoDB table for serverless application
resource "aws_dynamodb_table" "serverless_table" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  # Partition Key
  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  # Optional Sort Key
  dynamic "attribute" {
    for_each = var.sort_key != null ? [1] : []

    content {
      name = var.sort_key
      type = var.sort_key_type
    }
  }

  range_key = var.sort_key

  tags = var.tags
}