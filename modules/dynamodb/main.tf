provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "product" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null
  hash_key       = var.hash_key

  # Only include range_key if it's provided
  dynamic "attribute" {
    for_each = var.range_key != "" ? [1] : []
    content {
      name = var.range_key
      type = "S"  # Assuming range_key is a string
    }
  }

  attribute {
    name = var.hash_key
    type = "S"  # Assuming hash_key is a string
  }

  point_in_time_recovery {
    enabled = true
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  server_side_encryption {
    enabled = true
  }

  lifecycle {
    ignore_changes = [read_capacity, write_capacity]
  }
}

# Ensure the table is fully active before proceeding
resource "time_sleep" "wait_for_dynamodb" {
  depends_on      = [aws_dynamodb_table.product]
  create_duration = "15s"
}
