# -------- CORE ----------

variable "name" {
  type        = string
  description = "The name of the Azure Resource Group."

  validation {
    condition     = can(regex("^[a-zA-Z0-9._()-]{1,90}$", var.name)) && !endswith(var.name, ".")
    error_message = "The Resource Group name must be between 1-90 characters long."
  }
}

variable "location" {
  type        = string
  description = "The region the Azure Resource Group is deployed to."
}

variable "default_tags_enabled" {
  type        = bool
  default     = true
  description = "Option to enable or disable default tags."
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the Resource Groups."
}

variable "environment" {
  type        = string
  description = "Name of the environment the resource belongs to"

  validation {
    condition     = contains(["dev", "sit", "prod"], var.environment)
    error_message = "Environment must be either `dev`, `sit` or `prod`"
  }
}

# ----------------- RESOURCE GROUP -----------------

variable "lock_level" {
  type    = string
  default = ""

  validation {
    condition     = contains(["", "CanNotDelete", "ReadOnly"], var.lock_level)
    error_message = "The lock level must be \"\", CanNotDelete or ReadOnly."
  }
}
