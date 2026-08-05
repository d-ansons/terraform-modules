resource "azurerm_storage_account" "this" {
  name                              = var.name
  location                          = var.location
  account_replication_type          = var.account_replication_type
  account_tier                      = var.account_tier
  resource_group_name               = var.resource_group_name
  min_tls_version                   = var.min_tls_version
  public_network_access_enabled     = var.public_network_access_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  https_traffic_only_enabled        = true
  tags                              = local.tags
}
