module "iam" {
  source          = "../../modules/iam"
  tags            = var.tags
  roles           = var.roles
  inline_policies = var.inline_policies
}

# module "s3" {
#   source      = "../../modules/s3"
#   environment = var.environment
#   tags        = var.tags
#   buckets     = var.buckets
# }

module "dynamodb" {
  source          = "../../modules/dynamodb"
  environment     = var.environment
  tags            = var.tags
  dynamodb_tables = var.dynamodb_tables
}

module "secrets" {
  source      = "../../modules/secrets_manager"
  environment = var.environment
  tags        = var.tags
  secrets   = var.secrets
}