# tf-modules

usage:

'''
windows-vm:

provider "azurerm" {
  features {}
}

module "windows_vm" {
  source              = "./path/to/windows_vm_module"
  resource_group_name = "my-resource-group"
  location            = "East US"
  vm_name             = "my-windows-vm"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123!"
  create_public_ip    = true
  create_data_disk    = true
  data_disk_size_gb   = 200
  data_disk_type      = "Premium_LRS"
}

output "vm_public_ip" {
  value = module.windows_vm.public_ip_address
}

output "data_disk_id" {
  value = module.windows_vm.data_disk_id
}

'''