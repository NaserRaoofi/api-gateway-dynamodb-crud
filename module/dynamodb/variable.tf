variable "aws_region" {
  description = "AWS region for DynamoDB"
  type        = string
  default     = "eu-west-2"
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "product"
}

variable "billing_mode" {
  description = "Billing mode for the DynamoDB table (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Initial read capacity units for the table"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Initial write capacity units for the table"
  type        = number
  default     = 5
}

variable "max_read_capacity" {
  description = "Maximum auto scaling read capacity units"
  type        = number
  default     = 10
}

variable "min_read_capacity" {
  description = "Minimum auto scaling read capacity units"
  type        = number
  default     = 1
}

variable "max_write_capacity" {
  description = "Maximum auto scaling write capacity units"
  type        = number
  default     = 10
}

variable "min_write_capacity" {
  description = "Minimum auto scaling write capacity units"
  type        = number
  default     = 1
}

variable "hash_key" {
  description = "Name of the primary (hash) key attribute"
  type        = string
  default     = "product_id"
}

variable "range_key" {
  description = "Name of the sort (range) key attribute"
  type        = string
  default     = "category"
}
variable "product_data" {
  description = "List of products to be inserted into DynamoDB"
  type        = list(map(string))
  default     = []
}
