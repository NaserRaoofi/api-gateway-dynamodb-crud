############################
# Deployment and Stage     #
############################

provider "aws" {
  region = var.aws_region
}

module "dynamodb" {
  source = "../../modules/dynamodb"

  aws_region         = var.aws_region
  table_name         = var.table_name
  billing_mode       = var.billing_mode
  read_capacity      = var.read_capacity
  write_capacity     = var.write_capacity
  max_read_capacity  = var.max_read_capacity
  min_read_capacity  = var.min_read_capacity
  max_write_capacity = var.max_write_capacity
  min_write_capacity = var.min_write_capacity
  hash_key           = var.hash_key
  range_key          = var.range_key
}

module "iam" {
  source = "../../modules/iam"
  
  region             = var.aws_region
  iam_role_name      = var.iam_role_name
  dynamodb_table_arn = module.dynamodb.table_arn
}

module "apigateway" {
  source = "../../modules/apigateway"
  
  region              = var.aws_region
  api_name            = var.api_name
  stage_name          = var.stage_name
  dynamodb_table_name = var.table_name
  credentials_arn     = module.iam.iam_role_arn
  # Uncomment the next line if you have a CloudWatch IAM role
  # cloudwatch_role_arn = module.cloudwatch_iam.role_arn
}
