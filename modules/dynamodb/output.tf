output "table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.product.name
}

output "table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.product.arn
}

output "table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.product.id
}

output "stream_arn" {
  description = "The ARN of the DynamoDB stream"
  value       = aws_dynamodb_table.product.stream_arn
}

output "dynamodb_table_ready" {
  value       = time_sleep.wait_for_dynamodb.id
  description = "Indicator that the DynamoDB table is ready"
}
