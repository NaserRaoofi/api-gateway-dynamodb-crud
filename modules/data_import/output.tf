output "import_status" {
  value       = "Products imported successfully: ${null_resource.import_products.id}"
  description = "Status of the DynamoDB import operation"
}
