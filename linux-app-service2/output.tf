output "name" {
  value       = azurerm_linux_web_app.this.name
  description = "The name of the Web App"
}

output "default_hostname" {
  value       = azurerm_linux_web_app.this.default_hostname
  description = "The default hostname of the Web App"
}
