variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "workspace_name" {
  description = "Name of the storage account"
  type        = string
}

variable "sku" {
    type = string
    description = "SKU"
    default = "PerGB2018"
}

variable "retention_in_days" {
    type = number
    description = "retention days"
    default = 30 
}