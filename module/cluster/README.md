<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.8 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 1.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | >= 1.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_advanced_cluster.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/advanced_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | (Optional) Flag that indicates whether the cluster can perform backups. If true, the cluster can perform backups. You must set this value to true for NVMe clusters. | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The Name of the Mongo Cluster to provision | `string` | n/a | yes |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of Mongo Cluster to provision | `string` | `"REPLICASET"` | no |
| <a name="input_default_read_concern"></a> [default\_read\_concern](#input\_default\_read\_concern) | (Optional) Default level of acknowledgment requested from MongoDB for read operations set for this cluster. | `string` | `"local"` | no |
| <a name="input_default_write_concern"></a> [default\_write\_concern](#input\_default\_write\_concern) | (Optional) Default level of acknowledgment requested from MongoDB for write operations set for this cluster. | `string` | `"majority"` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | (Optional) Capacity, in gigabytes, of the host's root volume. | `number` | `10` | no |
| <a name="input_endpoint_ids"></a> [endpoint\_ids](#input\_endpoint\_ids) | List of all Private Endpoint IDs from all regions | `list(string)` | `[]` | no |
| <a name="input_fail_index_key_too_long"></a> [fail\_index\_key\_too\_long](#input\_fail\_index\_key\_too\_long) | (Optional) When true, documents can only be updated or inserted if, for all indexed fields on the target collection, the corresponding index entries do not exceed 1024 bytes. When false, mongod writes documents that exceed the limit but does not index them. | `bool` | `false` | no |
| <a name="input_javascript_enabled"></a> [javascript\_enabled](#input\_javascript\_enabled) | (Optional) When true, the cluster allows execution of operations that perform server-side executions of JavaScript. When false, the cluster disables execution of those operations. | `bool` | `true` | no |
| <a name="input_minimum_enabled_tls_protocol"></a> [minimum\_enabled\_tls\_protocol](#input\_minimum\_enabled\_tls\_protocol) | (Optional) Sets the minimum Transport Layer Security (TLS) version the cluster accepts for incoming connections. | `string` | `"TLS1_2"` | no |
| <a name="input_mongo_db_major_version"></a> [mongo\_db\_major\_version](#input\_mongo\_db\_major\_version) | (Optional) Version of the cluster to deploy. | `string` | `null` | no |
| <a name="input_no_table_scan"></a> [no\_table\_scan](#input\_no\_table\_scan) | (Optional) When true, the cluster disables the execution of any query that requires a collection scan to return results. When false, the cluster allows the execution of those operations. | `bool` | `false` | no |
| <a name="input_num_shards"></a> [num\_shards](#input\_num\_shards) | (Required) Provide this value if you set a cluster\_type of SHARDED or GEOSHARDED. Omit this value if you selected a cluster\_type of REPLICASET. This API resource accepts 1 through 50, inclusive. This parameter defaults to 1. If you specify a num\_shards value of 1 and a cluster\_type of SHARDED, Atlas deploys a single-shard sharded cluster. Don't create a sharded cluster with a single shard for production environments. Single-shard sharded clusters don't provide the same benefits as multi-shard configurations. | `number` | `1` | no |
| <a name="input_oplog_min_retention_hours"></a> [oplog\_min\_retention\_hours](#input\_oplog\_min\_retention\_hours) | (Optional) Minimum retention window for cluster's oplog expressed in hours. A value of null indicates that the cluster uses the default minimum oplog window that MongoDB Cloud calculates. | `number` | `null` | no |
| <a name="input_oplog_size_mb"></a> [oplog\_size\_mb](#input\_oplog\_size\_mb) | (Optional) The custom oplog size of the cluster. Without a value that indicates that the cluster uses the default oplog size calculated by Atlas. | `number` | `null` | no |
| <a name="input_pit_enabled"></a> [pit\_enabled](#input\_pit\_enabled) | (Optional) - Flag that indicates if the cluster uses Continuous Cloud Backup. | `bool` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | MongoDB Atlas Project ID | `string` | n/a | yes |
| <a name="input_replication_specs"></a> [replication\_specs](#input\_replication\_specs) | Configuration for cluster regions and the hardware provisioned in them. | `any` | `[]` | no |
| <a name="input_retain_backups_enabled"></a> [retain\_backups\_enabled](#input\_retain\_backups\_enabled) | (Optional) Set to true to retain backup snapshots for the deleted cluster. M10 and above only. | `bool` | `false` | no |
| <a name="input_termination_protection_enabled"></a> [termination\_protection\_enabled](#input\_termination\_protection\_enabled) | Flag that indicates whether termination protection is enabled on the cluster. If set to true, MongoDB Cloud won't delete the cluster. If set to false, MongoDB Cloud will delete the cluster. | `bool` | `false` | no |
| <a name="input_version_release_system"></a> [version\_release\_system](#input\_version\_release\_system) | (Optional) - Release cadence that Atlas uses for this cluster. This parameter defaults to LTS. If you set this field to CONTINUOUS, you must omit the mongo\_db\_major\_version field. | `string` | `"LTS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | n/a |
<!-- END_TF_DOCS -->