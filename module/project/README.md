# project

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.8 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 1.15.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 1.15.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [mongodbatlas_custom_dns_configuration_cluster_aws.test](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/custom_dns_configuration_cluster_aws) | resource |
| [mongodbatlas_database_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/database_user) | resource |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project) | resource |
| [mongodbatlas_third_party_integration.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/third_party_integration) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [mongodbatlas_atlas_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/atlas_user) | data source |
| [mongodbatlas_roles_org_id.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/roles_org_id) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_collect_database_specifics_statistics"></a> [collect\_database\_specifics\_statistics](#input\_collect\_database\_specifics\_statistics) | (Optional) Flag that indicates whether to enable statistics in cluster metrics collection for the project. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_database_users"></a> [database\_users](#input\_database\_users) | Users and their roles to assign to clusters in this project | <pre>list(object({<br>    username = string<br>    roles = list(object({<br>      name            = string<br>      database_name   = string<br>      collection_name = optional(string)<br>    }))<br>    scopes = optional(list(object({<br>      name = string<br>      type = string<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_default_alerts_settings"></a> [default\_alerts\_settings](#input\_default\_alerts\_settings) | (Optional) It allows users to disable the creation of the default alert settings. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_custom_dns"></a> [enable\_custom\_dns](#input\_enable\_custom\_dns) | (Optional) Provides a Custom DNS Configuration for Atlas Clusters on AWS resource.. | `bool` | `false` | no |
| <a name="input_enable_data_explorer"></a> [enable\_data\_explorer](#input\_enable\_data\_explorer) | (Optional) Flag that indicates whether to enable Data Explorer for the project. | `bool` | `true` | no |
| <a name="input_enable_extended_storage_sizes"></a> [enable\_extended\_storage\_sizes](#input\_enable\_extended\_storage\_sizes) | (Optional) Flag that indicates whether to enable extended storage sizes for the specified project. | `bool` | `false` | no |
| <a name="input_enable_performance_advisor"></a> [enable\_performance\_advisor](#input\_enable\_performance\_advisor) | (Optional) Flag that indicates whether to enable Performance Advisor and Profiler for the project. If enabled, you can analyze database logs to recommend performance improvements. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_realtime_performance_panel"></a> [enable\_realtime\_performance\_panel](#input\_enable\_realtime\_performance\_panel) | (Optional) Flag that indicates whether to enable Real Time Performance Panel for the project. If enabled, you can see real time metrics from your MongoDB database. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_schema_advisor"></a> [enable\_schema\_advisor](#input\_enable\_schema\_advisor) | (Optional) Flag that indicates whether to enable Schema Advisor for the project. If enabled, you receive customized recommendations to optimize your data model and enhance performance. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_integrations"></a> [integrations](#input\_integrations) | List of maps defining Atlas compatible integrations | `list(map(string))` | `[]` | no |
| <a name="input_limits"></a> [limits](#input\_limits) | (Optional) Map of project limits. https://www.mongodb.com/docs/atlas/reference/api-resources-spec/#tag/Projects/operation/setProjectLimit | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the Atlas Project | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) The email address of the project owner. | `string` | `null` | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | Secrets Manager ID to update with database user credentials | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | (Optional) List of teams and their roles assigned to the project. | <pre>list(object({<br>    id    = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.8 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 1.15.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.8 |
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | >= 1.15.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [mongodbatlas_custom_dns_configuration_cluster_aws.test](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/custom_dns_configuration_cluster_aws) | resource |
| [mongodbatlas_database_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/database_user) | resource |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [mongodbatlas_atlas_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/atlas_user) | data source |
| [mongodbatlas_roles_org_id.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/roles_org_id) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_collect_database_specifics_statistics"></a> [collect\_database\_specifics\_statistics](#input\_collect\_database\_specifics\_statistics) | (Optional) Flag that indicates whether to enable statistics in cluster metrics collection for the project. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_database_users"></a> [database\_users](#input\_database\_users) | Users and their roles to assign to clusters in this project | <pre>list(object({<br>    username = string<br>    roles = list(object({<br>      name            = string<br>      database_name   = string<br>      collection_name = optional(string)<br>    }))<br>    scopes = optional(list(object({<br>      name = string<br>      type = string<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_default_alerts_settings"></a> [default\_alerts\_settings](#input\_default\_alerts\_settings) | (Optional) It allows users to disable the creation of the default alert settings. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_custom_dns"></a> [enable\_custom\_dns](#input\_enable\_custom\_dns) | (Optional) Provides a Custom DNS Configuration for Atlas Clusters on AWS resource.. | `bool` | `false` | no |
| <a name="input_enable_data_explorer"></a> [enable\_data\_explorer](#input\_enable\_data\_explorer) | (Optional) Flag that indicates whether to enable Data Explorer for the project. | `bool` | `true` | no |
| <a name="input_enable_extended_storage_sizes"></a> [enable\_extended\_storage\_sizes](#input\_enable\_extended\_storage\_sizes) | (Optional) Flag that indicates whether to enable extended storage sizes for the specified project. | `bool` | `false` | no |
| <a name="input_enable_performance_advisor"></a> [enable\_performance\_advisor](#input\_enable\_performance\_advisor) | (Optional) Flag that indicates whether to enable Performance Advisor and Profiler for the project. If enabled, you can analyze database logs to recommend performance improvements. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_realtime_performance_panel"></a> [enable\_realtime\_performance\_panel](#input\_enable\_realtime\_performance\_panel) | (Optional) Flag that indicates whether to enable Real Time Performance Panel for the project. If enabled, you can see real time metrics from your MongoDB database. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_schema_advisor"></a> [enable\_schema\_advisor](#input\_enable\_schema\_advisor) | (Optional) Flag that indicates whether to enable Schema Advisor for the project. If enabled, you receive customized recommendations to optimize your data model and enhance performance. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_limits"></a> [limits](#input\_limits) | (Optional) Map of project limits. https://www.mongodb.com/docs/atlas/reference/api-resources-spec/#tag/Projects/operation/setProjectLimit | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the Atlas Project | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) The email address of the project owner. | `string` | `null` | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | Secrets Manager ID to update with database user credentials | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | (Optional) List of teams and their roles assigned to the project. | <pre>list(object({<br>    id    = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
<!-- END_TF_DOCS -->
