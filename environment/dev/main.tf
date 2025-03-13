provider "aws" {
  region = "eu-west-2"
}

module "dynamodb" {
  source = "../../module/dynamodb"

  aws_region         = var.aws_region
  table_name         = var.table_name
  billing_mode       = var.billing_mode
  read_capacity      = var.read_capacity
  write_capacity     = var.write_capacity
  max_read_capacity  = var.max_read_capacity
  min_read_capacity  = var.min_read_capacity
  max_write_capacity = var.max_write_capacity
  min_write_capacity = var.min_write_capacity
  hash_key           = var.hash_key
  range_key          = var.range_key
}
