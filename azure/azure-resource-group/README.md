## Design decisions

**No module-wide `enabled` flag.** The resource group is always created — it isn't conditional. To skip creating this module's resources entirely, wrap the module call itself with `count`/`for_each` at the call site (supported natively since Terraform 0.13), rather than relying on an internal toggle:
```hcl
module "resource_group" {
  count  = var.create_resource_group ? 1 : 0
  source = "..."
}
```
An internal `enabled` variable would require `count` and `[0]` indexing on every resource and output inside this module, duplicating what the caller already gets for free — more surface area for indexing bugs, no added capability.

**`lock_level` is the only conditional resource.** The management lock is a genuine optional sub-feature of an always-created resource group, unlike "does the resource group exist at all" — so it alone uses the `count = var.lock_level == "" ? 0 : 1` pattern.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->