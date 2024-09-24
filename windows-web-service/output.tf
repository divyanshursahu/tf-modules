output "webapp_id" {
  value = azurerm_windows_web_app.this.id
}

output "webapp_url" {
  value = azurerm_windows_web_app.this.default_hostname
}