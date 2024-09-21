resource "azurerm_mssql_database" "database" {
  name      = var.database_name
  server_id = var.server_id
  
  sku_name                     = var.database_sku
  max_size_gb                  = var.max_size_gb
  zone_redundant               = var.zone_redundant
  auto_pause_delay_in_minutes  = var.auto_pause_delay_in_minutes
  min_capacity                 = var.min_capacity
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"

#   short_term_retention_policy {
#     retention_days = var.backup_retention_days
#   }

#   long_term_retention_policy {
#     weekly_retention  = var.weekly_retention
#     monthly_retention = var.monthly_retention
#     yearly_retention  = var.yearly_retention
#     week_of_year      = var.week_of_year
#   }
}


