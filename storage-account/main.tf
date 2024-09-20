resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    default_action             = var.network_rules.default_action
    ip_rules                   = var.network_rules.ip_rules
    virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
    bypass                     = var.network_rules.bypass
  }
}

resource "azurerm_storage_share" "file_shares" {
  for_each             = { for idx, share in var.file_shares : share.name => share }
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = each.value.quota
}

resource "azurerm_storage_container" "containers" {
  for_each              = { for idx, container in var.containers : container.name => container }
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = each.value.container_access_type
}