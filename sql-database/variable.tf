variable "server_id" {
  type        = string
  description = "The ID of the SQL Server where the database will be created"
}

variable "database_name" {
  type        = string
  description = "Name of the SQL Database"
}

variable "database_sku" {
  type        = string
  description = "The SKU of the database"
  default     = "S0"
}

variable "max_size_gb" {
  type        = number
  description = "The max size of the database in gigabytes"
  default     = 2
}

variable "zone_redundant" {
  type        = bool
  description = "Whether or not this database is zone redundant"
  default     = false
}

variable "auto_pause_delay_in_minutes" {
  type        = number
  description = "Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled"
  default     = -1
}

variable "min_capacity" {
  type        = number
  description = "Minimal capacity that database will always have allocated, if not paused"
  default     = 0.5
}

# variable "backup_retention_days" {
#   type        = number
#   description = "Point in Time Restore configuration. Value has to be between 7 and 35"
#   default     = 7
# }

# variable "weekly_retention" {
#   type        = string
#   description = "The weekly retention policy for an LTR backup in an ISO 8601 format"
#   default     = "P1W"
# }

# variable "monthly_retention" {
#   type        = string
#   description = "The monthly retention policy for an LTR backup in an ISO 8601 format"
#   default     = "P1M"
# }

# variable "yearly_retention" {
#   type        = string
#   description = "The yearly retention policy for an LTR backup in an ISO 8601 format"
#   default     = "P1Y"
# }

# variable "week_of_year" {
#   type        = number
#   description = "The week of year to take the yearly backup in an ISO 8601 format"
#   default     = 1
# }