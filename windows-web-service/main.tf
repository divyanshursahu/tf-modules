
resource "azurerm_windows_web_app" "this" {
  name                = var.webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    ftps_state                    = "Disabled"
    ip_restriction_default_action = "Allow"
    vnet_route_all_enabled        = false
    application_stack {
      dotnet_version = "v6.0"
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
    ftps_state                    = "Disabled"
    ip_restriction_default_action = "Allow"
    vnet_route_all_enabled        = false
    application_stack {
      dotnet_version = "v6.0"
    }
  }
}