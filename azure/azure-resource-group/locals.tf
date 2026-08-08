locals {
  default_tags = var.default_tags_enabled ? { Environment = var.environment } : {}
  tags         = merge(local.default_tags, var.additional_tags)
}
