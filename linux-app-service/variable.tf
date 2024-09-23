variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "service_plan_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "app_service_name" {
  type        = string
  description = "Name of the App Service"
}

variable "docker_image" {
  description = "Docker image to use (e.g., 'nginx', 'node', etc.)"
  type        = string
}

variable "docker_tag" {
  description = "Docker image tag (e.g., 'latest', 'alpine')"
  type        = string
  default     = "latest"
}
# variable "stack_config" {
#   type = object({
#     docker_image     = string
#     docker_image_tag = string
#   })
#   description = "Application stack configuration for the main app service"
# }

