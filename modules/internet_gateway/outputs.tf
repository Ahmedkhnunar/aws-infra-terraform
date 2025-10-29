output "igw_ids" {
  value = { for k, v in aws_internet_gateway.managed : k => v.id }
}