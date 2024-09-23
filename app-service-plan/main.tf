# modules/app-service-plan/main.tf

locals {
  is_premium = can(regex("^P(remium)?v[23]", var.sku_name))
  zone_balancing_enabled = var.enable_zone_redundancy && local.is_premium
}

resource "azurerm_service_plan" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  zone_balancing_enabled = local.zone_balancing_enabled
}
