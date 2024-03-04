variable "project_id" {
  description = "MongoDB Atlas Project ID"
  type        = string
}

variable "cluster_name" {
  description = "The Name of the Mongo Cluster to provision"
  type        = string
}

variable "cluster_type" {
  description = "The type of Mongo Cluster to provision"
  type        = string
  default     = "REPLICASET"

  validation {
    condition     = contains(["REPLICASET", "SHARDED", "GEOSHARDED"], var.cluster_type)
    error_message = "The cluster_type must be one of REPLICASET, SHARDED, or GEOSHARDED."
  }
}

variable "disk_size_gb" {
  description = "(Optional) Capacity, in gigabytes, of the host's root volume."
  type        = number
  default     = 10
}

variable "backup_enabled" {
  description = "(Optional) Flag that indicates whether the cluster can perform backups. If true, the cluster can perform backups. You must set this value to true for NVMe clusters."
  type        = bool
  default     = false
}

variable "retain_backups_enabled" {
  description = "(Optional) Set to true to retain backup snapshots for the deleted cluster. M10 and above only."
  type        = bool
  default     = false
}

variable "mongo_db_major_version" {
  description = "(Optional) Version of the cluster to deploy."
  type        = string
  default     = null
}

variable "pit_enabled" {
  description = "(Optional) - Flag that indicates if the cluster uses Continuous Cloud Backup."
  type        = bool
  default     = null
}

variable "replication_specs" {
  description = "Configuration for cluster regions and the hardware provisioned in them."
  type        = any
  default     = []
}

variable "termination_protection_enabled" {
  description = "Flag that indicates whether termination protection is enabled on the cluster. If set to true, MongoDB Cloud won't delete the cluster. If set to false, MongoDB Cloud will delete the cluster."
  type        = bool
  default     = false
}

variable "version_release_system" {
  description = "(Optional) - Release cadence that Atlas uses for this cluster. This parameter defaults to LTS. If you set this field to CONTINUOUS, you must omit the mongo_db_major_version field."
  type        = string
  default     = "LTS"
}

variable "default_read_concern" {
  description = "(Optional) Default level of acknowledgment requested from MongoDB for read operations set for this cluster."
  type        = string
  default     = "local"
}

variable "default_write_concern" {
  description = "(Optional) Default level of acknowledgment requested from MongoDB for write operations set for this cluster."
  type        = string
  default     = "majority"
}

variable "fail_index_key_too_long" {
  description = "(Optional) When true, documents can only be updated or inserted if, for all indexed fields on the target collection, the corresponding index entries do not exceed 1024 bytes. When false, mongod writes documents that exceed the limit but does not index them."
  type        = bool
  default     = false
}

variable "javascript_enabled" {
  description = "(Optional) When true, the cluster allows execution of operations that perform server-side executions of JavaScript. When false, the cluster disables execution of those operations."
  type        = bool
  default     = true
}

variable "minimum_enabled_tls_protocol" {
  description = "(Optional) Sets the minimum Transport Layer Security (TLS) version the cluster accepts for incoming connections."
  type        = string
  default     = "TLS1_2"
}

variable "no_table_scan" {
  description = "(Optional) When true, the cluster disables the execution of any query that requires a collection scan to return results. When false, the cluster allows the execution of those operations."
  type        = bool
  default     = false
}

variable "oplog_size_mb" {
  description = "(Optional) The custom oplog size of the cluster. Without a value that indicates that the cluster uses the default oplog size calculated by Atlas."
  type        = number
  default     = null
}

variable "oplog_min_retention_hours" {
  description = "(Optional) Minimum retention window for cluster's oplog expressed in hours. A value of null indicates that the cluster uses the default minimum oplog window that MongoDB Cloud calculates."
  type        = number
  default     = null
}

variable "num_shards" {
  description = "(Required) Provide this value if you set a cluster_type of SHARDED or GEOSHARDED. Omit this value if you selected a cluster_type of REPLICASET. This API resource accepts 1 through 50, inclusive. This parameter defaults to 1. If you specify a num_shards value of 1 and a cluster_type of SHARDED, Atlas deploys a single-shard sharded cluster. Don't create a sharded cluster with a single shard for production environments. Single-shard sharded clusters don't provide the same benefits as multi-shard configurations."
  type        = number
  default     = 1
}

variable "endpoint_ids" {
  description = "List of all Private Endpoint IDs from all regions"
  type        = list(string)
  default     = []
}
