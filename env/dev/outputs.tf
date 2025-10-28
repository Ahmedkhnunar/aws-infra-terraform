# env/dev/outputs.tf

output "iam_roles" {
  description = "IAM roles created in the IAM module"
  value       = module.iam.iam_roles
}


output "secret_arns" {
  description = "Secret ARNs from the secrets module"
  value       = module.secrets.secret_arns
}
