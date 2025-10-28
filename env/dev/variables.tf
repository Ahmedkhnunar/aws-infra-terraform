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

variable "buckets" {
  description = "S3 buckets configuration"
  type = map(object({
    bucket        = string
    region        = string
    creation_date = string
  }))
  default = {}
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