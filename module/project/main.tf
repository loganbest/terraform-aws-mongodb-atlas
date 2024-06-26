data "mongodbatlas_roles_org_id" "this" {}

data "mongodbatlas_atlas_user" "this" {
  count    = (var.owner != null) ? 1 : 0
  username = var.owner
}

resource "mongodbatlas_project" "this" {
  name             = var.name
  org_id           = data.mongodbatlas_roles_org_id.this.org_id
  project_owner_id = try(data.mongodbatlas_atlas_user.this[0].user_id, null)

  dynamic "teams" {
    for_each = var.teams

    content {
      team_id    = teams.value.id
      role_names = teams.value.roles
    }
  }

  dynamic "limits" {
    for_each = var.limits

    content {
      name  = limits.key
      value = limits.value
    }
  }

  with_default_alerts_settings                     = var.default_alerts_settings
  is_collect_database_specifics_statistics_enabled = var.collect_database_specifics_statistics
  is_data_explorer_enabled                         = var.enable_data_explorer
  is_extended_storage_sizes_enabled                = var.enable_extended_storage_sizes
  is_performance_advisor_enabled                   = var.enable_performance_advisor
  is_realtime_performance_panel_enabled            = var.enable_realtime_performance_panel
  is_schema_advisor_enabled                        = var.enable_schema_advisor
}

resource "mongodbatlas_custom_dns_configuration_cluster_aws" "test" {
  project_id = mongodbatlas_project.this.id
  enabled    = var.enable_custom_dns
}

resource "mongodbatlas_third_party_integration" "this" {
  for_each = { for k, v in var.integrations : v.type => v }

  project_id                  = mongodbatlas_project.this.id
  type                        = lookup(each.value, "type", "WEBHOOK")
  api_key                     = lookup(each.value, "api_key", null)
  region                      = lookup(each.value, "region", null)
  service_key                 = lookup(each.value, "service_key", null)
  routing_key                 = lookup(each.value, "routing_key", null)
  url                         = lookup(each.value, "url", null)
  secret                      = lookup(each.value, "secret", null)
  microsoft_teams_webhook_url = lookup(each.value, "microsoft_teams_webhook_url", null)
  user_name                   = lookup(each.value, "user_name", null)
  password                    = lookup(each.value, "password", null)
  service_discovery           = lookup(each.value, "service_discovery", null)
  scheme                      = lookup(each.value, "scheme", null)
  enabled                     = lookup(each.value, "enabled", null)
}
