provider "aws" {
  region = var.region
}

#####################
# API Gateway Setup #
#####################

resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_name
  description = "API Gateway for Product resource integrated with DynamoDB"
}

# Create the /product resource under the API root
resource "aws_api_gateway_resource" "product" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "product"
}

##############################
# API Gateway Methods & Integration
##############################

# POST Method on /product
resource "aws_api_gateway_method" "product_post" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.product.id
  http_method   = "POST"
  authorization = "NONE"
}

# Integration for POST method
resource "aws_api_gateway_integration" "product_post_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.product.id
  http_method             = aws_api_gateway_method.product_post.http_method
  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:${var.region}:dynamodb:action/PutItem"
  credentials             = var.credentials_arn

  request_templates = {
    "application/json" = jsonencode({
      TableName = var.dynamodb_table_name,
      Item = {
        id = { S = "$context.requestId" },
        category = { S = "$input.path('$.category')" },
        name = { S = "$input.path('$.name')" },
        description = { S = "$input.path('$.description')" },
        price = { N = "$input.path('$.price')" },
        stock = { N = "$input.path('$.stock')" },
        created_at = { S = "$context.requestTimeEpoch" }
      }
    })
  }

  timeout_milliseconds = 29000
}

# GET Method on /product
resource "aws_api_gateway_method" "product_get" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.product.id
  http_method   = "GET"
  authorization = "NONE"
}

# Integration for GET method
resource "aws_api_gateway_integration" "product_get_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.product.id
  http_method             = aws_api_gateway_method.product_get.http_method
  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:${var.region}:dynamodb:action/GetItem"
  credentials             = var.credentials_arn

  request_templates = {
    "application/json" = jsonencode({
      TableName = var.dynamodb_table_name,
      Key = {
        id = { S = "$input.params('id')" }
      }
    })
  }

  timeout_milliseconds = 29000
}

# API Gateway Deployment
resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [
    aws_api_gateway_integration.product_post_integration,
    aws_api_gateway_integration.product_get_integration
  ]
  
  rest_api_id = aws_api_gateway_rest_api.api.id
}

# API Gateway Stage
resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = var.stage_name
}
