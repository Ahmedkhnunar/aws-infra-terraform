# terraform {
#   backend "s3" {
#     bucket         = "123-porter-dev-ops-terraform"       # S3 bucket name
#     key            = "envs/dev/terraform.tfstate" # Path within the bucket
#     region         = "us-east-1"                 # Bucket region
#     encrypt        = true                        # Encrypt state at rest
#     # dynamodb_table = "terraform-locks"           # Optional: for state locking
#   }
# }