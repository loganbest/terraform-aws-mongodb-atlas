variable "name" {
  description = "(Required) Name of the Atlas Project"
  type        = string
}

variable "owner" {
  description = "(Optional) The email address of the project owner."
  type        = string
  default     = null
}

variable "teams" {
  description = "(Optional) List of teams and their roles assigned to the project."
  type = list(object({
    id    = string
    roles = list(string)
  }))
  default = []
}

variable "limits" {
  description = "(Optional) Map of project limits. https://www.mongodb.com/docs/atlas/reference/api-resources-spec/#tag/Projects/operation/setProjectLimit"
  type        = map(string)
  default     = {}
}

variable "default_alerts_settings" {
  description = "(Optional) It allows users to disable the creation of the default alert settings. By default, this flag is set to true."
  type        = bool
  default     = true
}

variable "collect_database_specifics_statistics" {
  description = "(Optional) Flag that indicates whether to enable statistics in cluster metrics collection for the project. By default, this flag is set to true."
  type        = bool
  default     = true
}

variable "enable_data_explorer" {
  description = "(Optional) Flag that indicates whether to enable Data Explorer for the project."
  type        = bool
  default     = true
}

variable "enable_extended_storage_sizes" {
  description = "(Optional) Flag that indicates whether to enable extended storage sizes for the specified project."
  type        = bool
  default     = false
}

variable "enable_performance_advisor" {
  description = "(Optional) Flag that indicates whether to enable Performance Advisor and Profiler for the project. If enabled, you can analyze database logs to recommend performance improvements. By default, this flag is set to true."
  type        = bool
  default     = true
}

variable "enable_realtime_performance_panel" {
  description = "(Optional) Flag that indicates whether to enable Real Time Performance Panel for the project. If enabled, you can see real time metrics from your MongoDB database. By default, this flag is set to true."
  type        = bool
  default     = true
}

variable "enable_schema_advisor" {
  description = "(Optional) Flag that indicates whether to enable Schema Advisor for the project. If enabled, you receive customized recommendations to optimize your data model and enhance performance. By default, this flag is set to true."
  type        = bool
  default     = true
}

variable "enable_custom_dns" {
  description = "(Optional) Provides a Custom DNS Configuration for Atlas Clusters on AWS resource.."
  type        = bool
  default     = false
}

variable "create_network_container" {
  description = "(Optional) When true, will create a network peering container."
  type        = bool
  default     = false
}

variable "enable_network_peering" {
  description = "(Optional) When true, will create network peering via VPC Peering."
  type        = bool
  default     = false
}

variable "enable_privatelink" {
  description = "(Optional) When true, will create network peering via PrivateLink."
  type        = bool
  default     = false
}

variable "network_container_config" {
  description = "Properties to configure the Network Container"
  type = object({
    atlas_cidr_block = string
    region           = string
  })
  default = null
}

variable "network_peering_config" {
  description = "Properties to configure VPC Peering"
  type = list(object({
    region          = string
    vpc_cidr        = string
    vpc_id          = string
    account_id      = string
    route_table_ids = list(string)
  }))
  default = []
}

variable "privatelink_config" {
  description = "Properties to configure PrivateLink peering"
  type = object({
    region          = string
    vpc_id          = string
    private_subnets = list(string)
  })
  default = null
}

variable "database_users" {
  description = "Users and their roles to assign to clusters in this project"
  type = list(object({
    username = string
    roles = list(object({
      name            = string
      database_name   = string
      collection_name = optional(string)
    }))
    scopes = optional(list(object({
      name = string
      type = string
    })), [])
  }))
  default = []
}

variable "ip_allow_list" {
  description = "IP's to allow to connect to clusters in the project (network peering, direct, etc)"
  type        = list(string)
  default     = []
}

variable "secret_id" {
  description = "Secrets Manager ID to update with database user credentials"
  type        = string
  default     = null
}
