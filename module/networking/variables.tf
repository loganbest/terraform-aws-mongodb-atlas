variable "project_id" {
  description = "Atlas Project ID"
  type        = string
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

variable "ip_allow_list" {
  description = "IP's to allow to connect to clusters in the project (network peering, direct, etc)"
  type        = list(string)
  default     = []
}
