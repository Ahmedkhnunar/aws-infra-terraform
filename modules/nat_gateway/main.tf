resource "aws_nat_gateway" "managed" {
  for_each = var.nat_gateways

  allocation_id = lookup(
    var.eip_map,
    lookup({ for t in each.value.tags : t.Key => t.Value }, "Name", "default"),
    values(var.eip_map)[0]
  )

  subnet_id = lookup(
    var.subnet_map,
    lookup({ for t in each.value.tags : t.Key => t.Value }, "Name", "default"),
    values(var.subnet_map)[0]
  )

  tags = merge(
    var.tags,
    {
      ManagedBy  = "terraform"
      Imported   = "true"
      Environment = var.environment
    },
    { for tag in coalesce(each.value.tags, []) : tag.Key => tag.Value }
  )

  lifecycle {
    ignore_changes = [tags_all]
  }
}
