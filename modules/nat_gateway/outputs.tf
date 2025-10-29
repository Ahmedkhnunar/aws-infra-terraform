output "nat_gateway_ids" {
  description = "NAT Gateway IDs"
  value       = { for k, v in aws_nat_gateway.managed : k => v.id }
}