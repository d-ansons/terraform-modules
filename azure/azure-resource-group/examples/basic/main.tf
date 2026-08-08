provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "../.."
  name        = "rg-name-example"
  location    = "uksouth"
  environment = "dev"
}
