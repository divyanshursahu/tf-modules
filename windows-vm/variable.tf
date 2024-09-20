# File: variables.tf

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_name" {
  description = "Name of the Windows VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "os_disk_type" {
  description = "OS disk type"
  type        = string
  default     = "Standard_LRS"
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
  default     = false
}

variable "public_ip_sku" {
  description = "SKU for the public IP"
  type        = string
  default     = "Basic"
}

variable "allocation_method" {
  description = "Allocation method for the public IP"
  type        = string
  default     = "Static"
}

variable "create_data_disk" {
  description = "Whether to create a data disk for the VM"
  type        = bool
  default     = false
}

variable "data_disk_size_gb" {
  description = "Size of the data disk in GB"
  type        = number
  default     = 100
}

variable "data_disk_type" {
  description = "Type of the data disk"
  type        = string
  default     = "Standard_LRS"
}
