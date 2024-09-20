output "storage_account_id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "network_rules" {
  description = "Network rules applied to the storage account"
  value = {
    default_action             = azurerm_storage_account.storage.network_rules[0].default_action
    ip_rules                   = azurerm_storage_account.storage.network_rules[0].ip_rules
    virtual_network_subnet_ids = azurerm_storage_account.storage.network_rules[0].virtual_network_subnet_ids
    bypass                     = azurerm_storage_account.storage.network_rules[0].bypass
  }
}

output "file_share_urls" {
  description = "URLs of the created file shares"
  value       = { for name, share in azurerm_storage_share.file_shares : name => share.url }
}

output "container_names" {
  description = "Names of the created blob containers"
  value       = [for container in azurerm_storage_container.containers : container.name]
}