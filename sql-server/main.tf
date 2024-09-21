resource "azurerm_mssql_server" "server" {
  name                         = var.server_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  version                      = "12.0"
  administrator_login          = var.sql_authentication ? var.sql_admin_username : null
  administrator_login_password = var.sql_authentication ? var.sql_admin_password : null

  azuread_administrator {
    login_username = var.microsoft_authentication ? var.microsoft_admin_username : null
    object_id      = var.microsoft_authentication ? var.microsoft_admin_object_id : null
  }

  identity {
    type = "SystemAssigned"
  }
}
