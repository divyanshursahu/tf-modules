```
module "web_app" {
  source = "./module"

  resource_group_name   = "my-resource-group"
  location              = "East US"
  app_service_plan_name = "my-app-service-plan"
  app_name              = "my-web-app"
  docker_image          = "nginx"  # Example starter image
  docker_tag            = "latest"
  custom_hostname       = "www.example.com"
}
```