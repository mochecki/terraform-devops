# Azure Key-Vault

Terraform module for deploying an Azure key vault.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.30.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.30.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.access_policies](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.self_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_private_dns_a_record.keyvault_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_zone.keyvault_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.keyvault_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.keyvault_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.new_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azuread_group.ad_groups](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_service_principal.ad_service_principals](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azuread_user.ad_users](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_private_endpoint_connection.keyvault_private_endpoint_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |
| [azurerm_resource_group.existing_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | List of access policy permissions. | `list` | `[]` | no |
| <a name="input_certificate_owners_contacts"></a> [certificate\_owners\_contacts](#input\_certificate\_owners\_contacts) | Allows certificate owners to provide contact information for notification about life-cycle events of expiration and renewal of certificate. | <pre>list(object({<br>    email = string<br>    name  = string<br>    phone = string<br>  }))</pre> | `[]` | no |
| <a name="input_create_new_resource_group"></a> [create\_new\_resource\_group](#input\_create\_new\_resource\_group) | Create a new resource group or select an existing resource group. Default is to select an existing resource group. | `bool` | `false` | no |
| <a name="input_enable_azure_disk_encryption_for_volume_encryption"></a> [enable\_azure\_disk\_encryption\_for\_volume\_encryption](#input\_enable\_azure\_disk\_encryption\_for\_volume\_encryption) | Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| <a name="input_enable_azure_resource_manager_for_template_deployment"></a> [enable\_azure\_resource\_manager\_for\_template\_deployment](#input\_enable\_azure\_resource\_manager\_for\_template\_deployment) | Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | `bool` | `false` | no |
| <a name="input_enable_azure_virtual_machines_for_deployment"></a> [enable\_azure\_virtual\_machines\_for\_deployment](#input\_enable\_azure\_virtual\_machines\_for\_deployment) | Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | An Azure Private Endpoint is a network interface that connects you privately and securely to a service powered by Azure Private Link. <br>The private endpoint uses a private IP address from your VNet, effectively bringing the service into your VNet. | `bool` | `false` | no |
| <a name="input_enable_purge_protection"></a> [enable\_purge\_protection](#input\_enable\_purge\_protection) | Enabling purge protection on a key vault is an irreversible action. <br>Once the purge protection property has been set to `true`, it cannot be changed or removed.<br>              <br>Values:<br><br>  `false` = Disable purge protection (allow key vault and objects to be purged during retention period)<br><br>  `true` = Enable purge protection (enforce a mandatory retention period for deleted vaults and vault objects) | `bool` | `true` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Specifies whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions.<br><br>Read [Azure RBAC documentation](https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli) for providing access to Key Vault keys, certificates, and secrets with an Azure role-based access control. | `bool` | `false` | no |
| <a name="input_keyvault_dns_a_record_ttl"></a> [keyvault\_dns\_a\_record\_ttl](#input\_keyvault\_dns\_a\_record\_ttl) | The Time To Live (TTL) of the DNS record in seconds. | `number` | `300` | no |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | Azure Key Vault name must only contain alphanumeric characters and dashes and cannot start with a number. | `string` | n/a | yes |
| <a name="input_network_access_control_lists"></a> [network\_access\_control\_lists](#input\_network\_access\_control\_lists) | Network ACLs (access control lists) specifies what services can access your key vault.<br><br>bypass                      = (Required) Specifies which traffic can bypass the network rules. Possible values are `AzureServices` and `None`.<br>default\_action              = (Required) The Default Action to use when no rules match from `ip_rules / virtual_network_subnet_ids`. Possible values are `Allow` and `Deny`.<br>ip\_rules                    = (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.<br>virtual\_network\_subnet\_ids  = (Optional) One or more Subnet IDs which should be able to access this Key Vault. | <pre>object({<br>    bypass                     = string<br>    default_action             = string<br>    ip_rules                   = list(string)<br>    virtual_network_subnet_ids = list(string)<br>  })</pre> | <pre>{<br>  "bypass": "AzureServices",<br>  "default_action": "Deny",<br>  "ip_rules": [],<br>  "virtual_network_subnet_ids": []<br>}</pre> | no |
| <a name="input_pricing_tier"></a> [pricing\_tier](#input\_pricing\_tier) | Azure Key Vault service is offered in two service tiers: `standard` and `premium` | `string` | `"standard"` | no |
| <a name="input_region"></a> [region](#input\_region) | Deployment region of the resources created using this module. | `string` | `"uksouth"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. <br>It can be configured to between 7 to 90 days. Once it has been set, it cannot be changed or removed. | `number` | `90` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Existing Subnet within a Virtual Network. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created using this module. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | Existing Virtual Network. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | Key Vault identifier. |
| <a name="output_keyvault_name"></a> [keyvault\_name](#output\_keyvault\_name) | Key Vault name. |
| <a name="output_keyvault_private_dns_zone_domain"></a> [keyvault\_private\_dns\_zone\_domain](#output\_keyvault\_private\_dns\_zone\_domain) | Key Vault private endpoint DNS record. |
| <a name="output_keyvault_private_endpoint"></a> [keyvault\_private\_endpoint](#output\_keyvault\_private\_endpoint) | Key Vault private endpoint. |
| <a name="output_keyvault_private_endpoint_fqdn"></a> [keyvault\_private\_endpoint\_fqdn](#output\_keyvault\_private\_endpoint\_fqdn) | Key Vault private endpoint fully-qualified domain name (FQDN) address. |
| <a name="output_keyvault_private_endpoint_ip_addresses"></a> [keyvault\_private\_endpoint\_ip\_addresses](#output\_keyvault\_private\_endpoint\_ip\_addresses) | Key Vault private endpoint IP addresses. |
| <a name="output_keyvault_uri"></a> [keyvault\_uri](#output\_keyvault\_uri) | Key Vault URI for performing operations on keys and secrets. |
<!-- END_TF_DOCS -->