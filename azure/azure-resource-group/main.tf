resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.name
  tags     = local.tags
}

resource "azurerm_management_lock" "resource-group-level" {
  count      = var.lock_level == "" ? 0 : 1
  name       = format("%s-lock", var.name)
  scope      = azurerm_resource_group.this.id
  lock_level = var.lock_level
}
