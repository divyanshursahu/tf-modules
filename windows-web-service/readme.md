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