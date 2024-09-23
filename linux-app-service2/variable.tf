variable "name" {
  type        = string
  description = "Name of the Web App"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "stack_config" {
  type = object({
    docker_image     = string
    docker_image_tag = string
  })
  description = "Application stack configuration for the main app service"
}

