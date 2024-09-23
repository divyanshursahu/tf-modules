# outputs.tf

output "app_service_name" {
  value       = azurerm_linux_web_app.this.name
  description = "The name of the App Service"
}

output "app_service_default_hostname" {
  value       = azurerm_linux_web_app.this.default_hostname
  description = "The default hostname of the App Service"
}

output "app_service_plan_id" {
  value       = azurerm_service_plan.this.id
  description = "The ID of the App Service Plan"
}

# output "deployment_slot_names" {
#   value       = [for slot in azurerm_linux_web_app_slot.this : slot.name]
#   description = "The names of the deployment slots"
# }