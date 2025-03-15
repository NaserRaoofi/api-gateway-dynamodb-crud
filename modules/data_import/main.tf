# Read the product data from the JSON file
data "local_file" "product_data" {
  filename = var.product_data_file
}

# Use a null_resource with triggers to track file changes
resource "null_resource" "import_products" {
  depends_on = [var.dynamodb_table_ready]

  # This triggers the resource to be recreated when the file content changes
  triggers = {
    file_content_md5 = md5(data.local_file.product_data.content)
  }
}
