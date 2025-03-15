output "api_gateway_invoke_url" {
  value       = "${aws_api_gateway_stage.api_stage.invoke_url}/product"
  description = "The URL to invoke the API Gateway"
}

output "api_gateway_id" {
  value       = aws_api_gateway_rest_api.api.id
  description = "The ID of the API Gateway"
}
