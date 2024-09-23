variable "name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
}

variable "os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include `Windows` and `Linux`."
  default     = "Linux"

  validation {
    condition     = contains(["Windows", "Linux"], var.os_type)
    error_message = "The os_type must be either 'Windows' or 'Linux'."
  }
}

variable "sku_name" {
  type        = string
  description = "SKU name for the App Service Plan"
  default     = "P1v2"
}

variable "worker_count" {
  type        = number
  description = "Number of Workers (instances) to be deployed"
  default     = 1
}

variable "enable_zone_redundancy" {
  type        = bool
  description = "Enable zone redundancy for premium tier (v2 and v3) App Service Plans"
  default     = false
}

