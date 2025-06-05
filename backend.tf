terraform {
  backend "s3" {
    bucket         = "real-state-terraform-state-bucket"     # Nome do bucket S3 para o backend, conforme definido em terraform.tfvars
    key            = "real-state-dynamodb/terraform.tfstate"  # Caminho/nome do arquivo de estado dentro do bucket
    region         = "us-east-1"                             # Região AWS do seu bucket S3
    encrypt        = true                                    # Recomenda-se criptografar o estado (SSE-S3 por padrão)
    use_lockfile   = true                                    # Habilita o bloqueio de estado baseado em arquivo no S3
  }
}