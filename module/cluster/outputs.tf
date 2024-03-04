locals {
  private_endpoints = flatten([for cs in mongodbatlas_advanced_cluster.this.connection_strings : cs.private_endpoint])

  connection_strings = [
    for pe in local.private_endpoints : pe.srv_connection_string
    if length([for e in pe.endpoints : e.endpoint_id if contains(var.endpoint_ids, e.endpoint_id)]) > 0
  ]
}

output "connection_string" {
  value = length(local.connection_strings) > 0 ? local.connection_strings[0] : ""
}
