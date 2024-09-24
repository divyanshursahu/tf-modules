variable "create_subnet_delegation" {
  description = "Whether to create a delegation on the subnet"
  type        = bool
  default     = false
}

variable "delegated_service_name" {
  description = "The name of the service to delegate the subnet to"
  type        = string
  default     = "Microsoft.ContainerInstance/containerGroups"
}

variable "delegated_service_actions" {
  description = "The list of actions to allow for the delegated service"
  type        = list(string)
  default     = ["Microsoft.Network/virtualNetworks/subnets/action"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "example-rg"
  virtual_network_name = "example-vnet"
  address_prefixes     = ["10.0.1.0/24"]

  dynamic_delegation {
    count                   = var.create_subnet_delegation ? 1 : 0
    name                    = "example-delegation"
    service_delegation {
      name    = var.delegated_service_name
      actions = var.delegated_service_actions
    }
  }
}
```

```hcl
module "subnet" {
  source = "./path/to/subnet-delegation"

  create_subnet_delegation = true
  delegated_service_name   = "Microsoft.ContainerInstance/containerGroups"
  delegated_service_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
}

 service_delegation {
      name    = var.enable_delegation[count.index] ? var.delegated_service_name : ""
      actions = var.enable_delegation[count.index] ? var.delegated_service_actions : []

variable "enable_delegation" {
  description = "Whether to enable subnet delegation for each subnet"
  type        = list(bool)
}

variable "delegated_service_name" {
  description = "The name of the service to delegate the subnet to"
  type        = string
  default     = "Microsoft.ContainerInstance/containerGroups"
}

variable "delegated_service_actions" {
  description = "The list of actions to allow for the delegated service"
  type        = list(string)
  default     = ["Microsoft.Network/virtualNetworks/subnets/action"]
}
```
