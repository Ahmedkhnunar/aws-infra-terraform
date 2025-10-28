# Output all managed secrets as a map
output "secrets" {
  description = "Map of all managed AWS Secrets Manager secrets."
  value = {
    for k, v in aws_secretsmanager_secret.managed :
    k => {
      name = v.name
      arn  = v.arn
      id   = v.id
    }
  }
}

# Output ARNs only (simpler reference form)
output "secret_arns" {
  description = "Map of secret ARNs keyed by their logical name."
  value = {
    for k, v in aws_secretsmanager_secret.managed :
    v.name => v.arn
  }
}

# Output secret rotation configurations (only if created)
output "secret_rotations" {
  description = "Rotation configurations for secrets with rotation enabled."
  value = {
    for k, v in aws_secretsmanager_secret_rotation.rotation :
    k => {
      arn            = v.arn
      rotation_lambda_arn = v.rotation_lambda_arn
      automatically_after_days = v.rotation_rules[0].automatically_after_days
    }
  }
}
