# env/dev/outputs.tf

output "iam_roles" {
  description = "IAM roles created in the IAM module"
  value       = module.iam.iam_roles
}

output "secret_arns" {
  description = "Secret ARNs from the secrets module"
  value       = module.secrets.secret_arns
}

output "kms_key_ids" {
  description = "KMS key IDs from the KMS module"
  value       = module.kms.kms_key_ids
}

output "kms_alias_names" {
  description = "KMS alias names from the KMS module"
  value       = module.kms.kms_alias_names
}
output "vpc" {
  description = "VPCs created in the VPC module"
  value       = module.vpc.vpc_ids
}
output "eip" {
  description = "Elastic IPs created in the EIP module"
  value       = module.eip.eip_ids
}
output "eip_public_ips" {
  description = "Elastic IP public IPs created in the EIP module"
  value       = module.eip.eip_public_ips
}