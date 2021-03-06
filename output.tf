# output "container_name" {
#   value       = module.container[*].container_name
#   description = "The name of the container"
# }

# output "ip_address" {
#   value       = flatten(module.container[*].ip_address)
#   description = "The name of the container"
# }

output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "The name of the socket for each application"
}