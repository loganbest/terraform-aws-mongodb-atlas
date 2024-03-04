output "pl_endpoint_id" {
  value = var.enable_privatelink ? aws_vpc_endpoint.this[0].id : null
}
