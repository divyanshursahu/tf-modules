usage:

```

module "sql_database" {
  source        = "./path/to/sql-database-module"
  server_id     = module.sql_server.server_id
  database_name = "my-database"
  
  database_sku          = "S0"
  max_size_gb           = 5
  zone_redundant        = true
  read_scale            = true
  backup_retention_days = 14

  weekly_retention  = "P1W"
  monthly_retention = "P1M"
  yearly_retention  = "P1Y"
  week_of_year      = 1
}

```