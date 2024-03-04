data "mongodbatlas_network_containers" "aws" {
  project_id    = var.project_id
  provider_name = "AWS"
}

resource "mongodbatlas_project_ip_access_list" "this" {
  for_each = toset(var.ip_allow_list)

  project_id = var.project_id
  cidr_block = each.value
  comment    = "managed by terragrunt"
}

# AWS VPC Peering
# Create the VPC peering connection request
resource "mongodbatlas_network_peering" "this" {
  for_each = { for k, v in var.network_peering_config : k => v if var.enable_network_peering }

  accepter_region_name   = each.value.region
  project_id             = var.project_id
  container_id           = [for c in data.mongodbatlas_network_containers.aws.results : c.id if c.region_name == upper(replace(each.value.region, "-", "_"))][0]
  provider_name          = "AWS"
  route_table_cidr_block = each.value.vpc_cidr
  vpc_id                 = each.value.vpc_id
  aws_account_id         = each.value.account_id
}

# Accept the peering connection request
resource "aws_vpc_peering_connection_accepter" "this" {
  for_each = { for k, v in mongodbatlas_network_peering.this : k => v if v.provider_name == "AWS" }

  vpc_peering_connection_id = each.value.connection_id
  auto_accept               = true
}

# Workaround VPC Peering eventual consistency for activating
resource "time_sleep" "wait_for_aws_peering_activation" {
  count = var.enable_network_peering ? 1 : 0

  depends_on       = [aws_vpc_peering_connection_accepter.this, mongodbatlas_network_peering.this]
  create_duration  = "30s"
  destroy_duration = "30s"
}

resource "aws_vpc_peering_connection_options" "this" {
  for_each = { for k, v in mongodbatlas_network_peering.this : k => v if v.provider_name == "AWS" }

  vpc_peering_connection_id = each.value.connection_id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [time_sleep.wait_for_aws_peering_activation[0]]
}

locals {
  routes_to_pcx = flatten([
    for peer_idx, peer in var.network_peering_config : [
      for table in peer.route_table_ids : {
        route_table_id = table
        peer_id        = mongodbatlas_network_peering.this[peer_idx].connection_id
        peer_cidr      = [for c in data.mongodbatlas_network_containers.aws.results : c.atlas_cidr_block if c.region_name == upper(replace(peer.region, "-", "_"))][0]
      }
    ]
  ])
}

# Create the routes to the Peering Connection
resource "aws_route" "this" {
  for_each = { for k, v in local.routes_to_pcx : "${v.route_table_id}_${v.peer_cidr}" => v if var.enable_network_peering }

  route_table_id            = each.value.route_table_id
  vpc_peering_connection_id = each.value.peer_id
  destination_cidr_block    = each.value.peer_cidr
}
# END AWS VPC Peering

# AWS Privatelink
resource "mongodbatlas_privatelink_endpoint" "this" {
  count = var.enable_privatelink ? 1 : 0

  project_id    = var.project_id
  provider_name = "AWS"
  region        = upper(replace(var.privatelink_config.region, "-", "_"))
}

resource "aws_vpc_endpoint" "this" {
  count = var.enable_privatelink ? 1 : 0

  vpc_id            = var.privatelink_config.vpc_id
  service_name      = mongodbatlas_privatelink_endpoint.this[0].endpoint_service_name
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.privatelink_config.private_subnets
}

resource "mongodbatlas_privatelink_endpoint_service" "this" {
  count = var.enable_privatelink ? 1 : 0

  project_id          = var.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.this[0].private_link_id
  endpoint_service_id = aws_vpc_endpoint.this[0].id
  provider_name       = "AWS"
}
# END AWS Privatelink
