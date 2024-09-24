resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.address_prefix]

  # Conditionally attach Service Endpoints if provided
  service_endpoints = length(var.service_endpoints) > 0 ? var.service_endpoints : null

  # Conditionally add Subnet Delegation if provided
# Conditionally add Subnet Delegation if provided using dynamic block
  dynamic "delegation" {
    for_each = var.delegation != null ? [var.delegation] : []

    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}
