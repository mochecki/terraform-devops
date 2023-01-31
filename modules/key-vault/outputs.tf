output "keyvault_id" {
  description = "Key Vault identifier."
  value       = azurerm_key_vault.kv.id
}

output "keyvault_name" {
  description = "Key Vault name."
  value       = azurerm_key_vault.kv.name
}

output "keyvault_uri" {
  description = "Key Vault URI for performing operations on keys and secrets."
  value       = azurerm_key_vault.kv.vault_uri
}

output "keyvault_private_endpoint" {
  description = "Key Vault private endpoint."
  value       = var.enable_private_endpoint ? element(concat(azurerm_private_endpoint.keyvault_private_endpoint.*.id, [""]), 0) : null
}

output "keyvault_private_dns_zone_domain" {
  description = "Key Vault private endpoint DNS record."
  value       = var.enable_private_endpoint ? element(concat(azurerm_private_dns_zone.keyvault_private_dns_zone.*.name, [""]), 0) : null
}

output "keyvault_private_endpoint_ip_addresses" {
  description = "Key Vault private endpoint IP addresses."
  value       = var.enable_private_endpoint ? flatten(azurerm_private_endpoint.keyvault_private_endpoint.0.custom_dns_configs.*.ip_addresses) : null
}

output "keyvault_private_endpoint_fqdn" {
  description = "Key Vault private endpoint fully-qualified domain name (FQDN) address."
  value       = var.enable_private_endpoint ? flatten(azurerm_private_endpoint.keyvault_private_endpoint.0.custom_dns_configs.*.fqdn) : null
}