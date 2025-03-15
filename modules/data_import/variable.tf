variable "product_data_file" {
  description = "Path to the JSON file containing product data"
  type        = string
}

variable "table_name" {
  description = "Name of the DynamoDB table to import data into"
  type        = string
}

variable "hash_key" {
  description = "Name of the hash key for the DynamoDB table"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "dynamodb_table_ready" {
  description = "Indicator that the DynamoDB table is ready"
  type        = string
  default     = ""
}
