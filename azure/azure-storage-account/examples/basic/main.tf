provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-sa-example"
  location = "uksouth"
}

module "storage_account" {
  source = "../.."

  name                = "saexample001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  environment         = "dev"
}
