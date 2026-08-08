# -------- RESOURCE GROUP --------

output "resource_group_id" {
  value       = azurerm_resource_group.this.id
  description = "The Resource Group identifier."
}

output "resource_group_name" {
  value       = azurerm_resource_group.this.name
  description = "The name of the Resource Group."
}

output "resource_group_location" {
  value       = azurerm_resource_group.this.location
  description = "The region the Resource Group belongs to."
}
