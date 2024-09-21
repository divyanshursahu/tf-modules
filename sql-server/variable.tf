variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "server_name" {
  type        = string
  description = "Name of the SQL Server"
}

variable "microsoft_authentication" {
  type        = bool
  description = "Enable Microsoft Entra authentication"
  default     = false
}

variable "sql_authentication" {
  type        = bool
  description = "Enable SQL authentication"
  default     = false
}

variable "microsoft_admin_username" {
  type        = string
  description = "Microsoft Entra admin username"
  default     = null
}

variable "microsoft_admin_object_id" {
  type        = string
  description = "Microsoft Entra admin object ID"
  default     = null
}

variable "sql_admin_username" {
  type        = string
  description = "SQL Server admin username"
  default     = null
}

variable "sql_admin_password" {
  type        = string
  description = "SQL Server admin password"
  default     = null
  sensitive   = true
}