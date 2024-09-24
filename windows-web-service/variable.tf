variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_name" {
  type = string
}

variable "webapp_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "P1v2"
}

variable "client_affinity_enabled" {
  type    = bool
  default = false
}

variable "virtual_network_subnet_id" {
  type    = string
  default = null
}

variable "create_deployment_slot" {
  type    = bool
  default = false
}

variable "ftps_state" {
  type    = string
  default = "Disabled"
}

variable "ip_restriction_default_action" {
  type    = string
  default = "Allow"
}

variable "vnet_route_all_enabled" {
  type    = bool
  default = false
}

variable "current_stack" {
  type    = string
  default = "dotnet"
}

variable "dotnet_version" {
  type    = string
  default = "v6.0"
}

variable "ip_restriction" {
  description = "Optional IP restriction block"
  type = object({
    action                    = string
    headers                   = list(string)
    name                      = string
    priority                  = number
    virtual_network_subnet_id = string
  })
  default = null
}

