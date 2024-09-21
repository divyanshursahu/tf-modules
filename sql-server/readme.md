usage:

```
module "sql_server" {
  source              = "./path/to/module"
  resource_group_name = "my-resource-group"
  location            = "eastus"
  server_name         = "my-sql-server"

  microsoft_authentication = true
  microsoft_admin_username = "entraadmin@mydomain.com"
  microsoft_admin_object_id = "00000000-0000-0000-0000-000000000000"

  sql_authentication    = true
  sql_admin_username    = "sqladmin"
  sql_admin_password    = "P@ssw0rd123!"
}
```