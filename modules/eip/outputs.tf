output "eip_ids" {
  description = "Elastic IP allocation IDs"
  value       = { for k, eip in aws_eip.managed : k => eip.id }
}

output "eip_public_ips" {
  description = "Elastic IP public addresses"
  value       = { for k, eip in aws_eip.managed : k => eip.public_ip }
}