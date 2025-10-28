# -----------------------------
# 🟢 1️⃣ Independent / foundational modules
# -----------------------------

module "iam" {
  source          = "../../modules/iam"
  tags            = var.tags
  roles           = var.roles
  inline_policies = var.inline_policies
}

module "kms" {
  source      = "../../modules/kms"
  environment = var.environment
  tags        = var.tags
  kms_keys    = var.kms_keys
  kms_aliases = var.kms_aliases
}

# module "s3" {
#   source      = "../../modules/s3"
#   environment = var.environment
#   tags        = var.tags
#   buckets     = var.buckets
# }

# module "vpc" {
#   source      = "../../modules/vpc"
#   environment = var.environment
#   tags        = var.tags
#   vpcs        = var.vpcs
# }

# module "eip" {
#   source       = "../../modules/eip"
#   environment  = var.environment
#   tags         = var.tags
#   eips         = var.eips
# }

# module "sns" {
#   source      = "../../modules/sns"
#   environment = var.environment
#   tags        = var.tags
#   topics      = var.topics
# }

# module "sqs" {
#   source      = "../../modules/sqs"
#   environment = var.environment
#   tags        = var.tags
#   sqs_queues  = var.sqs_queues
# }


# -----------------------------
# 🟡 2️⃣ Network layer
# -----------------------------
# module "subnet" {
#   source      = "../../modules/subnet"
#   environment = var.environment
#   tags        = var.tags
#   subnets     = var.subnets
# }

# module "internet_gateway" {
#   source            = "../../modules/internet_gateway"
#   environment       = var.environment
#   tags              = var.tags
#   internet_gateways = var.internet_gateways
# }

# module "route_table" {
#   source        = "../../modules/route_table"
#   environment   = var.environment
#   tags          = var.tags
#   route_tables  = var.route_tables
# }

# module "nacl" {
#   source       = "../../modules/nacl"
#   environment  = var.environment
#   tags         = var.tags
#   network_acls = var.network_acls
# }

# module "security_group" {
#   source          = "../../modules/security_group"
#   environment     = var.environment
#   tags            = var.tags
#   security_groups = var.security_groups
# }

# module "nat_gateway" {
#   source       = "../../modules/nat_gateway"
#   environment  = var.environment
#   tags         = var.tags
#   nat_gateways = var.nat_gateways
# }


# -----------------------------
# 🔵 3️⃣ Data / security / monitoring
# -----------------------------
module "secrets" {
  source      = "../../modules/secrets_manager"
  environment = var.environment
  tags        = var.tags
  secrets     = var.secrets
}

# module "cloudwatch" {
#   source       = "../../modules/cloudwatch"
#   environment  = var.environment
#   tags         = var.tags
#   log_groups   = var.log_groups
# }

# module "cloudtrail" {
#   source       = "../../modules/cloudtrail"
#   environment  = var.environment
#   tags         = var.tags
#   cloudtrails  = var.cloudtrails
# }

# module "config" {
#   source            = "../../modules/config"
#   environment       = var.environment
#   tags              = var.tags
#   recorders         = var.recorders
#   delivery_channels = var.delivery_channels
# }

# module "waf" {
#   source      = "../../modules/waf"
#   environment = var.environment
#   tags        = var.tags
#   ip_sets     = var.ip_sets
#   web_acls    = var.web_acls
# }


# -----------------------------
# 🟣 4️⃣ Compute / app / integration
# -----------------------------
# module "lambda_layers" {
#   source        = "../../modules/lambda_layer"
#   environment   = var.environment
#   tags          = var.tags
#   lambda_layers = var.lambda_layers
# }

# module "lambda" {
#   source      = "../../modules/lambda"
#   environment = var.environment
#   tags        = var.tags
#   functions   = var.functions
# }

# module "cognito" {
#   source            = "../../modules/cognito"
#   environment       = var.environment
#   tags              = var.tags
#   user_pools        = var.user_pools
#   user_pool_clients = var.user_pool_clients
#   identity_pools    = var.identity_pools
# }

# module "events" {
#   source      = "../../modules/events"
#   environment = var.environment
#   tags        = var.tags
#   event_rules = var.event_rules
# }

# module "stepfunctions" {
#   source         = "../../modules/stepfunctions"
#   environment    = var.environment
#   tags           = var.tags
#   state_machines = var.state_machines
# }

# module "apigateway" {
#   source                 = "../../modules/apigateway"
#   environment            = var.environment
#   tags                   = var.tags
#   rest_apis              = var.rest_apis
#   account                = var.account
#   domain_names           = var.domain_names
#   stages                 = var.stages
#   resources              = var.resources
#   methods                = var.methods
#   method_responses       = var.method_responses
#   integrations           = var.integrations
#   integration_responses  = var.integration_responses
#   deployments            = var.deployments
#   base_path_mappings     = var.base_path_mappings
# }

# -----------------------------
# ⚪ 5️⃣ Optional or data storage extras
# -----------------------------

module "dynamodb" {
  source          = "../../modules/dynamodb"
  environment     = var.environment
  tags            = var.tags
  dynamodb_tables = var.dynamodb_tables
}