output "dynamodb_table_name" {
  value       = module.dynamodb.table_name
  description = "Name of the DynamoDB table"
}

output "dynamodb_table_arn" {
  value       = module.dynamodb.table_arn
  description = "ARN of the DynamoDB table"
}

output "api_gateway_invoke_url" {
  value       = module.apigateway.api_gateway_invoke_url
  description = "The URL to invoke the API Gateway"
}

output "iam_role_arn" {
  value       = module.iam.iam_role_arn
  description = "IAM Role ARN for API Gateway to access DynamoDB"
}
