# ----------------------------------- Core -----------------------------------

variable "name" {
  type = string
  description = "The name of the resource."

  validation {
    condition = can(regex("^[a-z0-9]{3,24}$", var.name))
    error_message = "The name must contain valid characters and be between 3 and 24 characters."
  }
}

variable "location" {
  type = string
  description = <<DESCRIPTION
  Azure region where the resource will be deployed.
  If null, the location will be infered from the resource group name.
  >>
  DESCRIPTION
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group the storage account belongs to."
}

variable "environment" {
  type = string
  description = "Name of the environment the resource belongs to"

  validation {
    condition = contains(["dev", "sit", "prod"], var.environment)
    error_message = "Environment must be either `dev`, `sit` or `prod`"
  }
}

variable "default_tags_enabled" {
  type = bool
  default = true
  description = "Option to enable or disable default tags."
}

variable "additional_tags" {
  type = map(string)
  default = {}
  description = "Additional tags for the Storage Account."
}

# ----------------------------------- Storage -----------------------------------

variable "account_tier" {
  type = string
  default = "Standard"
  description = "Defines the Tier of the Storage Account."

  validation {
    condition = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Tier must be either `Standard` or `Premium`."
  }
}

variable "account_replication_type" {
  type = string
  default = "ZRS"
  description = "Defines the replication type to use for this Storage Account."

  validation {
    condition = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Replication type must be; `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` or `RAGZRS`"
  }
}

variable "infrastructure_encryption_enabled" {
  type = bool
  default = true
  description = "Enable or disable infrastructure encryption for the Storage Account."
}

# ----------------------------------- Network -----------------------------------

variable "min_tls_version" {
  type = string
  default = "TLS1_2"
  description = "The minimum supported TLS version for the Storage Account."

  validation {
    condition = contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "TLS version must be `TLS1_0`, `TLS1_1` or `TLS1_2`."
  }
}

variable "public_network_access_enabled" {
  type = bool
  default = false
  description = "Enable or disable public network access to the Storage Account."
}

variable "allow_nested_items_to_be_public" {
  type = bool
  default = false
  description = "Enable or disable public network access for nested items within the Storage Account."
}

