variable "internet_gateways" {
  type = map(object({
    Attachments = list(object({
      VpcId = string
    }))
    tags = optional(list(object({ Key = string, Value = string })))
  }))
}

variable "vpc_map" {
  description = "Mapping of Internet Gateway names to VPC IDs (from new VPCs)"
  type        = map(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  type = string
}
