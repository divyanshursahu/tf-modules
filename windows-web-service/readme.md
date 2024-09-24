```

module "windows_webapp" {
  source = "./modules/windows-webapp"

  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  service_plan_name         = "example-app-service-plan"
  webapp_name               = "example-windows-web-app"
  sku_name                  = "P1v2"
  client_affinity_enabled   = true
  virtual_network_subnet_id = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/..."
  create_deployment_slot    = true
}

```

```
# main.tf

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

module "windows_webapp" {
  source = "./modules/windows-webapp"

  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  service_plan_name             = "example-app-service-plan"
  webapp_name                   = "example-windows-web-app"
  sku_name                      = "P1v2"
  client_affinity_enabled       = true
  virtual_network_subnet_id     = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/..."
  create_deployment_slot        = true

  ftps_state                    = "Disabled"
  ip_restriction_default_action = "Allow"
  vnet_route_all_enabled        = false
  current_stack                 = "dotnet"
  dotnet_version                = "v6.0"

  # Optional IP restriction block
  ip_restriction = {
    action                    = "Allow"
    headers                   = []
    name                      = "allow_ag_access"
    priority                  = 10
    virtual_network_subnet_id = ""
  }
}

output "webapp_url" {
  value = module.windows_webapp.webapp_url
}
```