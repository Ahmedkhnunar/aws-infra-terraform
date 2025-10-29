output "subnet_ids" {
  description = "Map of subnet IDs created by this module"
  value       = { for k, subnet in aws_subnet.managed : k => subnet.id }
}

output "subnet_arns" {
  description = "Map of subnet ARNs created by this module"
  value       = { for k, subnet in aws_subnet.managed : k => subnet.arn }
}

output "subnet_cidr_blocks" {
  description = "Map of subnet CIDR blocks"
  value       = { for k, subnet in aws_subnet.managed : k => subnet.cidr_block }
}
