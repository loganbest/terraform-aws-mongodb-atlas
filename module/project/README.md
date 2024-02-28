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
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_peering_connection_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [mongodbatlas_custom_dns_configuration_cluster_aws.test](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/custom_dns_configuration_cluster_aws) | resource |
| [mongodbatlas_database_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/database_user) | resource |
| [mongodbatlas_network_container.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_container) | resource |
| [mongodbatlas_network_peering.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering) | resource |
| [mongodbatlas_privatelink_endpoint.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint) | resource |
| [mongodbatlas_privatelink_endpoint_service.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint_service) | resource |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project) | resource |
| [mongodbatlas_project_ip_access_list.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [mongodbatlas_atlas_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/atlas_user) | data source |
| [mongodbatlas_roles_org_id.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/roles_org_id) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_collect_database_specifics_statistics"></a> [collect\_database\_specifics\_statistics](#input\_collect\_database\_specifics\_statistics) | (Optional) Flag that indicates whether to enable statistics in cluster metrics collection for the project. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_create_network_container"></a> [create\_network\_container](#input\_create\_network\_container) | (Optional) When true, will create a network peering container. | `bool` | `false` | no |
| <a name="input_database_users"></a> [database\_users](#input\_database\_users) | Users and their roles to assign to clusters in this project | <pre>list(object({<br>    username = string<br>    roles = list(object({<br>      name            = string<br>      database_name   = string<br>      collection_name = optional(string)<br>    }))<br>    scopes = optional(list(object({<br>      name = string<br>      type = string<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_default_alerts_settings"></a> [default\_alerts\_settings](#input\_default\_alerts\_settings) | (Optional) It allows users to disable the creation of the default alert settings. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_custom_dns"></a> [enable\_custom\_dns](#input\_enable\_custom\_dns) | (Optional) Provides a Custom DNS Configuration for Atlas Clusters on AWS resource.. | `bool` | `false` | no |
| <a name="input_enable_data_explorer"></a> [enable\_data\_explorer](#input\_enable\_data\_explorer) | (Optional) Flag that indicates whether to enable Data Explorer for the project. | `bool` | `true` | no |
| <a name="input_enable_extended_storage_sizes"></a> [enable\_extended\_storage\_sizes](#input\_enable\_extended\_storage\_sizes) | (Optional) Flag that indicates whether to enable extended storage sizes for the specified project. | `bool` | `false` | no |
| <a name="input_enable_network_peering"></a> [enable\_network\_peering](#input\_enable\_network\_peering) | (Optional) When true, will create network peering via VPC Peering. | `bool` | `false` | no |
| <a name="input_enable_performance_advisor"></a> [enable\_performance\_advisor](#input\_enable\_performance\_advisor) | (Optional) Flag that indicates whether to enable Performance Advisor and Profiler for the project. If enabled, you can analyze database logs to recommend performance improvements. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_privatelink"></a> [enable\_privatelink](#input\_enable\_privatelink) | (Optional) When true, will create network peering via PrivateLink. | `bool` | `false` | no |
| <a name="input_enable_realtime_performance_panel"></a> [enable\_realtime\_performance\_panel](#input\_enable\_realtime\_performance\_panel) | (Optional) Flag that indicates whether to enable Real Time Performance Panel for the project. If enabled, you can see real time metrics from your MongoDB database. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_enable_schema_advisor"></a> [enable\_schema\_advisor](#input\_enable\_schema\_advisor) | (Optional) Flag that indicates whether to enable Schema Advisor for the project. If enabled, you receive customized recommendations to optimize your data model and enhance performance. By default, this flag is set to true. | `bool` | `true` | no |
| <a name="input_ip_allow_list"></a> [ip\_allow\_list](#input\_ip\_allow\_list) | IP's to allow to connect to clusters in the project (network peering, direct, etc) | `list(string)` | `[]` | no |
| <a name="input_limits"></a> [limits](#input\_limits) | (Optional) Map of project limits. https://www.mongodb.com/docs/atlas/reference/api-resources-spec/#tag/Projects/operation/setProjectLimit | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the Atlas Project | `string` | n/a | yes |
| <a name="input_network_container_config"></a> [network\_container\_config](#input\_network\_container\_config) | Properties to configure the Network Container | <pre>object({<br>    atlas_cidr_block = string<br>    region           = string<br>  })</pre> | `null` | no |
| <a name="input_network_peering_config"></a> [network\_peering\_config](#input\_network\_peering\_config) | Properties to configure VPC Peering | <pre>list(object({<br>    region          = string<br>    vpc_cidr        = string<br>    vpc_id          = string<br>    account_id      = string<br>    route_table_ids = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) The email address of the project owner. | `string` | `null` | no |
| <a name="input_privatelink_config"></a> [privatelink\_config](#input\_privatelink\_config) | Properties to configure PrivateLink peering | <pre>object({<br>    region          = string<br>    vpc_id          = string<br>    private_subnets = list(string)<br>  })</pre> | `null` | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | Secrets Manager ID to update with database user credentials | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | (Optional) List of teams and their roles assigned to the project. | <pre>list(object({<br>    id    = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->