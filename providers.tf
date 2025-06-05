terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Use o perfil 'development' do arquivo ~/.aws/credentials
  region = var.aws_region

  # Configurações específicas para LocalStack (se var.is_localstack_env for true)
  access_key                  = local.is_localstack_env ? "test" : null
  secret_key                  = local.is_localstack_env ? "test" : null
  skip_credentials_validation = local.is_localstack_env ? true : false
  skip_metadata_api_check     = local.is_localstack_env ? true : false
  skip_requesting_account_id  = local.is_localstack_env ? true : false

  dynamic "endpoints" {
    for_each = local.is_localstack_env ? { localstack = true } : {}
    content {
      # Adicione apenas os endpoints necessários para DynamoDB e serviços de suporte
      cloudwatch     = "http://localhost:4566"
      cloudwatchlogs = "http://localhost:4566"
      dynamodb       = "http://localhost:4566"
      iam            = "http://localhost:4566"
      sts            = "http://localhost:4566"
      # Se você usar KMS para criptografia do DynamoDB com chaves gerenciadas pelo cliente:
      # kms            = "http://localhost:4566"
    }
  }
}