variable "aws_region" {
  description = "AWS region for resources"
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
  description = "Initial read capacity units for the table (ignored if PAY_PER_REQUEST is used)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Initial write capacity units for the table (ignored if PAY_PER_REQUEST is used)"
  type        = number
  default     = 5
}

variable "max_read_capacity" {
  description = "Maximum auto-scaling read capacity units"
  type        = number
  default     = 10
}

variable "min_read_capacity" {
  description = "Minimum auto-scaling read capacity units"
  type        = number
  default     = 1
}

variable "max_write_capacity" {
  description = "Maximum auto-scaling write capacity units"
  type        = number
  default     = 10
}

variable "min_write_capacity" {
  description = "Minimum auto-scaling write capacity units"
  type        = number
  default     = 1
}

variable "hash_key" {
  description = "Name of the primary (hash) key attribute"
  type        = string
  default     = "id"
}

variable "range_key" {
  description = "Name of the sort (range) key attribute (leave empty if not used)"
  type        = string
  default     = ""
}

variable "product_data" {
  description = "List of products to be inserted into DynamoDB"
  type        = list(map(string))
  default     = []
}

variable "iam_role_name" {
  description = "Name of the IAM role for API Gateway integration"
  type        = string
  default     = "APIGatewayDynamoDBRole"
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "ProductAPI"
}

variable "stage_name" {
  description = "Deployment stage name"
  type        = string
  default     = "prod"
}

variable "product_data_file" {
  description = "Path to the JSON file containing product data"
  type        = string
  default     = "../data/product.json"
}
