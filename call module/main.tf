
module "linux_app_service_plan" {
  source              = "../app-service-plan"
  name                = "my-linux-plan"
  resource_group_name = "something"
  location            = "US EAST"
  os_type             = "Linux"
  sku_name            = "B1"
  worker_count        = 1
  depends_on = [ azurerm_resource_group.example ]
}

module "web_app_1" {
  source              = "../linux-app-service2"
  name                = "my-web-app-1"
  resource_group_name = "something"
  location            = "US EAST"
  service_plan_id     = module.linux_app_service_plan.id
  
  stack_config = {
    docker_image     = "nginx"
    docker_image_tag = "latest"
  }

   depends_on = [ azurerm_resource_group.example ]
}