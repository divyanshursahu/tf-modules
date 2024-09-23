
module "linux_app_service" {
  source = "../"  # Path to the module

  resource_group_name   = "my-linux-rg"
  location              = "East US"
  app_service_plan_name = "my-linux-plan"
  app_service_name      = "my-linux-app"
  
  sku_name = "S1"
  
  stack_config = {
    docker_image     = "nginx"
    docker_image_tag = "latest"
  }
  
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL" = "https://index.docker.io"
  }
  
  connection_strings = [
    {
      name  = "Database"
      type  = "PostgreSQL"
      value = "Server=my-server.postgres.database.azure.com;Database=mydb;Port=5432;User Id=user@my-server;Password=password;"
    }
  ]
  
  deployment_slots = [
    {
      name = "staging"
      stack_config = {
        docker_image     = "nginx"
        docker_image_tag = "1.21"
      }
      app_settings = {
        "ENVIRONMENT" = "staging"
      }
      connection_strings = []
    },
    {
      name = "testing"
      stack_config = {
        docker_image     = "nginx"
        docker_image_tag = "1.20"
      }
      app_settings = {
        "ENVIRONMENT" = "testing"
      }
      connection_strings = [
        {
          name  = "TestDatabase"
          type  = "PostgreSQL"
          value = "Server=test-server.postgres.database.azure.com;Database=testdb;Port=5432;User Id=testuser@test-server;Password=testpassword;"
        }
      ]
    }
  ]
}