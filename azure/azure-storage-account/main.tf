resource "azurerm_storage_account" "this" {
  #checkov:skip=CKV2_AZURE_33:Private endpoints depend on the caller's VNet topology; not modeled by this base module
  #checkov:skip=CKV2_AZURE_1:CMK requires a caller-provided Key Vault and identity; not modeled by this base module
  #checkov:skip=CKV_AZURE_33:Queue logging is configured via the azurerm_storage_account_queue_properties resource below; this pinned checkov version (3.2.533) only detects the deprecated inline queue_properties block

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
  shared_access_key_enabled         = var.shared_access_key_enabled
  tags                              = local.tags

  blob_properties {
    delete_retention_policy {
      days = var.soft_delete_retention_days
    }
  }

  sas_policy {
    expiration_period = var.sas_expiration_period
    expiration_action = "Log"
  }
}

resource "azurerm_storage_account_queue_properties" "this" {
  storage_account_id = azurerm_storage_account.this.id

  logging {
    delete                = true
    read                  = true
    write                 = true
    version               = "1.0"
    retention_policy_days = var.queue_logging_retention_days
  }
}
