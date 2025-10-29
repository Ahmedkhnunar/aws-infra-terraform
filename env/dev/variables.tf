variable "aws_profile" {
  description = "AWS CLI profile name to use"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "roles" {
  description = "Map of IAM Role configurations (auto-generated)"
  type = map(object({
    role_name                 = string
    path                      = optional(string, "/")
    assume_role_policy        = string  # JSON string
    description               = optional(string)
    max_session_duration      = optional(number)
    permissions_boundary      = optional(string)
    tags                      = optional(map(string))
    attached_managed_policies = optional(list(string), [])
  }))
  default = {}
}

variable "inline_policies" {
  description = "Map keyed by role_name|policy_name to inline policy configs"
  type = map(object({
    role_name   = string  # Must match a key from var.roles
    policy_name = string
    policy_json = string  # JSON string
  }))
  default = {}
}

variable "kms_keys" {
  description = "Map of KMS key configurations"
  type = map(object({
    description              = string
    key_usage               = optional(string)
    customer_master_key_spec = optional(string)
    key_rotation_enabled    = optional(bool)
    deletion_window_in_days = optional(number)
    policy                  = optional(string)
    alias_name              = optional(string)
    tags                    = optional(map(string))
  }))
  default = {}
}

variable "kms_aliases" {
  description = "KMS aliases and their key mappings"
  type        = map(string)
  default     = {}
}

variable "buckets" {
  description = "S3 buckets configuration"
  type = map(object({
    bucket        = string
    region        = string
    creation_date = string
  }))
  default = {}
}

variable "vpcs" {
  type = map(object({
    cidr_block           = string
    instance_tenancy     = optional(string)
    enable_dns_support   = optional(bool)
    enable_dns_hostnames = optional(bool)
    tags                 = optional(list(object({ Key = string, Value = string })))
  }))
}

variable "eips" {
  description = "Map of Elastic IPs and their configurations."
  type = map(object({
    allocation_id  = string
    public_ip      = string
    association_id = optional(string)
    tags           = optional(list(object({
      Key   = string
      Value = string
    })), [])
  }))
}

variable "subnets" {
  type = map(object({
    vpc_id                  = string
    cidr_block              = string
    availability_zone_id    = string
    map_public_ip_on_launch = optional(bool)
    tags                    = optional(list(object({ Key = string, Value = string })))
  }))
}

variable "dynamodb_tables" {
  type = map(any)
  default = {}
}

variable "secrets" {
  type = map(object({
    name                = string
    description         = string
    kms_key_id          = optional(string)
    rotation_enabled    = optional(bool)
    rotation_lambda_arn = optional(string)
    tags                = optional(list(object({ Key = string, Value = string })))
    # value is excluded intentionally
  }))
}