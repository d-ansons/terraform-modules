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

variable "environment" {
  type = string
  default = ""
  description = "Name of the environment the resource belongs to"

  validation {
    condition = ""
    error_message = "Environment must be either `dev`, `sit` or `prod`"
  }
}
