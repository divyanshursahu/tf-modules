variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network where the subnet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group containing the VNet"
  type        = string
}

variable "address_prefix" {
  description = "The address prefix for the Subnet"
  type        = string
}

variable "service_endpoints" {
  description = "A list of Service Endpoints to associate with the Subnet (optional)"
  type        = list(string)
  default     = []
}

variable "delegation" {
  description = "An optional delegation block for the Subnet"
  type = object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  })
  default = null
}
