resource "random_password" "this" {
  count = length(var.database_users)

  length  = 16
  special = false
}

resource "mongodbatlas_database_user" "this" {
  for_each = { for k, v in var.database_users : k => v }

  username           = each.value.username
  password           = random_password.this[each.key].result
  project_id         = mongodbatlas_project.this.id
  auth_database_name = try(each.value.auth_database_name, "admin")

  dynamic "roles" {
    for_each = each.value.roles

    content {
      role_name     = roles.value.name
      database_name = roles.value.database_name
    }
  }

  dynamic "scopes" {
    for_each = each.value.scopes

    content {
      name = scopes.value.name
      type = scopes.value.type
    }
  }
}

data "aws_secretsmanager_secret_version" "this" {
  secret_id = var.secret_id
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = var.secret_id

  secret_string = jsonencode(merge(
    try(jsondecode(data.aws_secretsmanager_secret_version.this.secret_string), {}),
    {
      db_user = mongodbatlas_database_user.this["0"].username,
      db_pass = mongodbatlas_database_user.this["0"].password
    }
  ))
}
