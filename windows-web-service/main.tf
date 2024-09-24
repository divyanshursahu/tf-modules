resource "azurerm_windows_web_app" "this" {
  name                = var.webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    ftps_state                    = var.ftps_state
    ip_restriction_default_action = var.ip_restriction_default_action
    vnet_route_all_enabled        = var.vnet_route_all_enabled

    application_stack {
      current_stack  = var.current_stack
      dotnet_version = var.dotnet_version
    }

    dynamic "ip_restriction" {
      for_each = var.ip_restriction != null ? [var.ip_restriction] : []
      content {
        action                    = ip_restriction.value.action
        headers                   = ip_restriction.value.headers
        name                      = ip_restriction.value.name
        priority                  = ip_restriction.value.priority
        virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
      }
    }
  }

  client_affinity_enabled    = var.client_affinity_enabled
  virtual_network_subnet_id  = var.virtual_network_subnet_id
}

resource "azurerm_windows_web_app_slot" "this" {
  count          = var.create_deployment_slot ? 1 : 0
  name           = "${var.webapp_name}-slot"
  app_service_id = azurerm_windows_web_app.this.id

  site_config {
    ftps_state                    = var.ftps_state
    ip_restriction_default_action = var.ip_restriction_default_action
    vnet_route_all_enabled        = var.vnet_route_all_enabled

    application_stack {
      current_stack  = var.current_stack
      dotnet_version = var.dotnet_version
    }

    dynamic "ip_restriction" {
      for_each = var.ip_restriction != null ? [var.ip_restriction] : []
      content {
        action                    = ip_restriction.value.action
        headers                   = ip_restriction.value.headers
        name                      = ip_restriction.value.name
        priority                  = ip_restriction.value.priority
        virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
      }
    }
  }
}
