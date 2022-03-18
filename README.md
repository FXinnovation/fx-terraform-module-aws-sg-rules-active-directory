# terraform-module-aws-sg-rules-active-directory

Terraform module that allows to apply Security Group rules for Active Directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 0.60.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 0.60.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| active\_directory\_cidrs | List of CIDR's of the active directory servers. | `list(string)` | `[]` | no |
| active\_directory\_security\_group\_ids | List of Security Group ID's of the active directory servers. | `list(string)` | `[]` | no |
| active\_directory\_security\_group\_ids\_count | Number of Security Group ID's of the active directory servers. | `number` | `0` | no |
| security\_group\_id | ID of the security group to which to apply the rules on. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning
This repository follows [Semantic Versioning 2.0.0](https://semver.org/)

## Git Hooks
This repository uses [pre-commit](https://pre-commit.com/) hooks.

### Usage

```
pre-commit install
pre-commit install -t commit-msg
```

## Commit Messages

This repository follows the [afcmf](https://github.com/FXinnovation/fx-pre-commit-afcmf) standard for it's commit messages.

## Changelog

The changelog message is generated using the `git-extras` package using the following command:
```
git changelog -a -t <target-version> -p
```
