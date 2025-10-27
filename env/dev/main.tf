module "iam" {
  source          = "../../modules/iam"
  tags            = var.tags
  roles           = var.roles
  inline_policies = var.inline_policies
}