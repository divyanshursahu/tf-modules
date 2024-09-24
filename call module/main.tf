
# module "linux_app_service_plan" {
#   source              = "../app-service-plan"
#   name                = "my-linux-plan"
#   resource_group_name = "something"
#   location            = "US EAST"
#   os_type             = "Linux"
#   sku_name            = "B1"
#   worker_count        = 1
#   depends_on = [ azurerm_resource_group.example ]
# }

# module "web_app_1" {
#   source              = "../linux-app-service2"
#   name                = "my-web-app-1"
#   resource_group_name = "something"
#   location            = "US EAST"
#   service_plan_id     = module.linux_app_service_plan.id
  
#   stack_config = {
#     docker_image     = "nginx"
#     docker_image_tag = "latest"
#   }

#    depends_on = [ azurerm_resource_group.example ]
# }

resource "azurerm_resource_group" "name" {
  name = "my-rg"
  location = "Central US"
}
module "vnet" {
  source              = "../vnet"
  vnet_name           = "my-vnet"
  location = "Central US"
  resource_group_name = azurerm_resource_group.name.name
  address_space       = ["10.0.0.0/16"]
}

# module "subnet" {
#   source              = "../subnet"
#   subnet_name         = "my-subnet"
#   vnet_name           = module.vnet.vnet_name
#   resource_group_name = azurerm_resource_group.name.name
#   address_prefix      = "10.0.1.0/24"
# }

module "subnet" {
  source              = "../subnet"
  subnet_name         = "my-subnet"
  vnet_name           = module.vnet.vnet_name
  resource_group_name = azurerm_resource_group.name.name
  address_prefix      = "10.0.1.0/24"

  service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]  # Adding Service Endpoints

  delegation = {
    name = "myDelegation"
    service_delegation = {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
