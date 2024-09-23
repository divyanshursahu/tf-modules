resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}:${var.docker_tag}"  # Specify the image and tag
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"  # Disable app service storage for Docker containers
  }
}