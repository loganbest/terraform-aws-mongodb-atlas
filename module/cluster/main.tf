resource "mongodbatlas_advanced_cluster" "this" {
  project_id                     = var.project_id
  name                           = var.cluster_name
  cluster_type                   = var.cluster_type
  backup_enabled                 = var.backup_enabled
  retain_backups_enabled         = var.retain_backups_enabled
  mongo_db_major_version         = var.mongo_db_major_version
  pit_enabled                    = var.pit_enabled
  termination_protection_enabled = var.termination_protection_enabled
  version_release_system         = var.version_release_system
  disk_size_gb                   = var.disk_size_gb

  replication_specs {
    num_shards = var.num_shards

    dynamic "region_configs" {
      for_each = var.replication_specs
      content {
        provider_name = "AWS"
        priority      = region_configs.value.electable_specs.node_count > 0 ? region_configs.value.priority : 0
        region_name   = upper(replace(region_configs.value.region_name, "-", "_"))

        dynamic "electable_specs" {
          for_each = lookup(region_configs.value, "electable_specs", null) != null ? [region_configs.value.electable_specs] : []

          content {
            instance_size = electable_specs.value.instance_size
            node_count    = electable_specs.value.node_count
          }
        }

        dynamic "analytics_specs" {
          for_each = lookup(region_configs.value, "analytics_specs", null) != null ? [region_configs.value.analytics_specs] : []

          content {
            instance_size = analytics_specs.value.instance_size
            node_count    = analytics_specs.value.node_count
          }
        }

        dynamic "read_only_specs" {
          for_each = lookup(region_configs.value, "read_only_specs", null) != null ? [region_configs.value.read_only_specs] : []

          content {
            instance_size = read_only_specs.value.instance_size
            node_count    = read_only_specs.value.node_count
          }
        }

        auto_scaling {
          disk_gb_enabled            = lookup(region_configs.value.auto_scaling, "disk_gb_enabled", true)
          compute_enabled            = lookup(region_configs.value.auto_scaling, "compute_enabled", false)
          compute_scale_down_enabled = lookup(region_configs.value.auto_scaling, "compute_scale_down_enabled", true)
          compute_min_instance_size  = lookup(region_configs.value.auto_scaling, "compute_min_instance_size", "M10")
          compute_max_instance_size  = lookup(region_configs.value.auto_scaling, "compute_max_instance_size", "M40")
        }
      }
    }
  }

  advanced_configuration {
    default_read_concern         = var.default_read_concern
    default_write_concern        = var.default_write_concern
    javascript_enabled           = var.javascript_enabled
    fail_index_key_too_long      = var.fail_index_key_too_long
    minimum_enabled_tls_protocol = var.minimum_enabled_tls_protocol
    no_table_scan                = var.no_table_scan
    oplog_size_mb                = var.oplog_size_mb
    oplog_min_retention_hours    = var.oplog_min_retention_hours
  }
}
