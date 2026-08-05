output "id" {
  value       = azurerm_storage_account.this.id
  description = "The ID of the Storage Account."
}

output "name" {
  value       = azurerm_storage_account.this.name
  description = "The name of the Storage Account."
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.this.primary_blob_endpoint
  description = "The public base URL for accessing blob containers."
}
