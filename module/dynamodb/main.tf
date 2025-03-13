provider "aws" {
  region = var.aws_region
}

# Load JSON file
locals {
  product_list = jsondecode(file("${path.module}/product.json"))
}

resource "aws_dynamodb_table" "product" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.hash_key
    type = "S"
  }

  attribute {
    name = var.range_key
    type = "S"
  }

  # Enable Point-In-Time Recovery (PITR)
  point_in_time_recovery {
    enabled = true
  }

  # Enable DynamoDB Streams with NEW_AND_OLD_IMAGES
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  # Enable Time-to-Live (TTL) on an attribute named "ttl"
  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  # Enable server-side encryption with AWS managed key
  server_side_encryption {
    enabled = true
  }
}
