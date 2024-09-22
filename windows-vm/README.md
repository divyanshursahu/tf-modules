# tf-modules

usage:

```
windows-vm:
module "windows_vm" {
  source              = "./path/to/windows_vm_module"
  resource_group_name = "my-resource-group"
  location            = "East US"
  vm_name             = "my-windows-vm"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = true
  create_nsg          = true
  nsg_rules = [
    {
      name                       = "AllowRDP"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTP"
      priority                   = 1100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

output "vm_public_ip" {
  value = module.windows_vm.public_ip_address
}

output "nsg_name" {
  value = module.windows_vm.nsg_name
}

```

simple usage:

```
module "simple_windows_vm" {
  source              = "./path/to/windows_vm_module"
  resource_group_name = "my-resource-group"
  location            = "East US"
  vm_name             = "my-simple-windows-vm"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
}
```