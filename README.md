# Skaylink Terraform module; SSH key

Deploys an SSH keypair to defined Azure key vault. 
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.private_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.public_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The environment the keypair will be used in, for example dev | `string` | n/a | yes |
| <a name="input_expiry_date"></a> [expiry\_date](#input\_expiry\_date) | The expiration time of the secret, in years, for example 1 | `number` | `3` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the key vault the keypair will be saved to | `any` | n/a | yes |
| <a name="input_use_case"></a> [use\_case](#input\_use\_case) | The use case for the keypair, for example aks or vms | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh_public_key"></a> [ssh\_public\_key](#output\_ssh\_public\_key) | n/a |
<!-- END_TF_DOCS -->