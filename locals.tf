locals {
  is_localstack_env = var.is_localstack_env

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}