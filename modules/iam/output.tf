output "iam_role_arn" {
  value       = aws_iam_role.apigw_dynamodb_role.arn
  description = "IAM Role ARN for API Gateway to access DynamoDB"
}
