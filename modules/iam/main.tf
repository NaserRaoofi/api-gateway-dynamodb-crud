provider "aws" {
  region = var.region
}

# IAM Role to allow API Gateway to access DynamoDB
resource "aws_iam_role" "apigw_dynamodb_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "apigateway.amazonaws.com"
      }
    }]
  })
}

# Attach an inline policy to the IAM Role for DynamoDB access
resource "aws_iam_role_policy" "apigw_dynamodb_policy" {
  name = "apigateway-dynamodb-policy"
  role = aws_iam_role.apigw_dynamodb_role.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action   = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ],
        Effect   = "Allow",
        Resource = var.dynamodb_table_arn
      }
    ]
  })
}
