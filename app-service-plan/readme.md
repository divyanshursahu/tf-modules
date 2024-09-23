usage:

```
# main.tf

module "windows_app_service_plan" {
  source              = "./modules/app-service-plan"
  name                = "my-windows-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Windows"
  sku_name            = "P1v2"
  worker_count        = 2
  enable_zone_redundancy = true
  
  tags = {
    environment = "production"
    project     = "webapp"
  }
}

module "linux_app_service_plan" {
  source              = "./modules/app-service-plan"
  name                = "my-linux-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v3"
  worker_count        = 3
  enable_zone_redundancy = true
  
  tags = {
    environment = "production"
    project     = "api"
  }
}
```