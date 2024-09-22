# Output the public IP address if created
output "public_ip_address" {
  value = var.create_public_ip ? azurerm_public_ip.vm_public_ip[0].ip_address : null
}

# Output the data disk ID if created
output "data_disk_id" {
  value = var.create_data_disk ? azurerm_managed_disk.data_disk[0].id : null
}


output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = var.create_nsg ? azurerm_network_security_group.vm_nsg[0].id : null
}

output "nsg_name" {
  description = "The name of the Network Security Group"
  value       = var.create_nsg ? azurerm_network_security_group.vm_nsg[0].name : null
}

