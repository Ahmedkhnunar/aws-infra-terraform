resource "aws_internet_gateway" "managed" {
  for_each = var.internet_gateways

  vpc_id = lookup(
    var.vpc_map,
    lookup({ for t in coalesce(each.value.tags, []) : t.Key => t.Value }, "Name", "InternetGateway"),
    values(var.vpc_map)[0]
  )

  tags = merge(
    var.tags,
    { ManagedBy = "terraform", Imported = "true", Environment = var.environment }
  )

  lifecycle {
    ignore_changes = []
  }
}

