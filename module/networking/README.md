# project

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.8 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 1.15.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.39.1 |
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 1.15.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_peering_connection_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [mongodbatlas_network_peering.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering) | resource |
| [mongodbatlas_privatelink_endpoint.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint) | resource |
| [mongodbatlas_privatelink_endpoint_service.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint_service) | resource |
| [mongodbatlas_project_ip_access_list.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list) | resource |
| [time_sleep.wait_for_aws_peering_activation](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [mongodbatlas_network_containers.aws](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/network_containers) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_network_peering"></a> [enable\_network\_peering](#input\_enable\_network\_peering) | (Optional) When true, will create network peering via VPC Peering. | `bool` | `false` | no |
| <a name="input_enable_privatelink"></a> [enable\_privatelink](#input\_enable\_privatelink) | (Optional) When true, will create network peering via PrivateLink. | `bool` | `false` | no |
| <a name="input_ip_allow_list"></a> [ip\_allow\_list](#input\_ip\_allow\_list) | IP's to allow to connect to clusters in the project (network peering, direct, etc) | `list(string)` | `[]` | no |
| <a name="input_network_peering_config"></a> [network\_peering\_config](#input\_network\_peering\_config) | Properties to configure VPC Peering | <pre>list(object({<br>    region          = string<br>    vpc_cidr        = string<br>    vpc_id          = string<br>    account_id      = string<br>    route_table_ids = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_privatelink_config"></a> [privatelink\_config](#input\_privatelink\_config) | Properties to configure PrivateLink peering | <pre>object({<br>    region          = string<br>    vpc_id          = string<br>    private_subnets = list(string)<br>  })</pre> | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Atlas Project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pl_endpoint_id"></a> [pl\_endpoint\_id](#output\_pl\_endpoint\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
