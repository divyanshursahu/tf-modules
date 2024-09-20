usage with file share and n/w etc: 

```
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "East US"
}

module "storage_account" {
  source               = "./modules/storage_account"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = "mystorageaccount123"
  
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  network_rules = {
    default_action = "Deny"
    ip_rules       = ["203.0.113.0/24"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
    bypass         = ["AzureServices", "Logging", "Metrics"]
  }
  
  file_shares = [
    {
      name  = "share1"
      quota = 100
    },
    {
      name  = "share2"
      quota = 200
    }
  ]
  
  containers = [
    {
      name = "container1"
      # container_access_type defaults to "private"
    },
    {
      name                  = "container2"
      container_access_type = "blob"
    }
  ]
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "primary_blob_endpoint" {
  value = module.storage_account.primary_blob_endpoint
}

output "file_share_urls" {
  value = module.storage_account.file_share_urls
}

output "container_names" {
  value = module.storage_account.container_names
}

output "network_rules" {
  value = module.storage_account.network_rules
}

```

simple usage:

```
module "simple_storage_account" {
  source               = "./modules/storage_account"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = "mysimplestorageacc123"
  
  # No network_rules or file_shares specified, so defaults will be used
}
```