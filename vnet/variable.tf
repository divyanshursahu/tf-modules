variable "vnet_name" {
  description = "The name of the VNet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}
