variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
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

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table to integrate with"
  type        = string
}

variable "credentials_arn" {
  description = "ARN of the IAM role for API Gateway to access DynamoDB"
  type        = string
}

variable "cloudwatch_role_arn" {
  description = "ARN of the IAM role for API Gateway to push logs to CloudWatch"
  type        = string
  default     = ""
}
