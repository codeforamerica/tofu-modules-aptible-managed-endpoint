output "id" {
  description = "ID of the Aptible endpoint."
  value       = aptible_endpoint.endpoint.endpoint_id
}

output "fqdn" {
  description = "Fully qualified domain name for the HTTPS endpoint."
  value       = aptible_endpoint.endpoint.virtual_domain
}

output "hostname" {
  description = "Hostname of the endpoint that was created."
  value       = aptible_endpoint.endpoint.external_hostname
}
