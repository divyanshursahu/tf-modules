output "server_id" {
  value       = azurerm_mssql_server.server.id
  description = "The ID of the SQL Server"
}

output "server_fqdn" {
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
  description = "The fully qualified domain name of the SQL Server"
}