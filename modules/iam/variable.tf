variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "iam_role_name" {
  description = "Name of the IAM role for API Gateway integration"
  type        = string
  default     = "APIGatewayDynamoDBRole"
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  type        = string
}
