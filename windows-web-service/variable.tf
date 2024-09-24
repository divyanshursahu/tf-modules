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

