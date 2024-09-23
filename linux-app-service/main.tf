resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      docker_image     = var.stack_config.docker_image
      docker_image_tag = var.stack_config.docker_image_tag
    }
  }
}





