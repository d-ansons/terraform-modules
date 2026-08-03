# terraform-modules

Repository of reusable Terraform modules for personal projects. Managed as an [Nx](https://nx.dev) monorepo.

## Toolchain

All tooling (Terraform, tflint, terraform-docs, checkov, Node/Nx) is pinned via [Devbox](https://www.jetify.com/devbox/docs/). Enter the environment with:

```sh
devbox shell
```

## Common tasks

Run a target for a single module:

```sh
nx <target> <module-name>
```

Run a target only for modules affected by your current changes (used in CI):

```sh
nx affected -t fmt,validate,lint,security-scan
```

Explore the module dependency graph:

```sh
nx graph
```

## Releasing

Module versions are cut independently per-module via [Nx Release](https://nx.dev/features/manage-releases), based on [Conventional Commits](https://www.conventionalcommits.org/) since the last release:

```sh
nx release --dry-run
```

## Branching

Trunk-based: short-lived `feat/`, `fix/`, `chore/` branches off `main`, merged via squash PR. See branch protection settings on `main` for required checks.
