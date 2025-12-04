terraform {
  backend "s3" {
    # O nome do bucket deve ser definido diretamente aqui.
    # Ele não pode ser uma variável.
    bucket       = "real-state-terraform-state-bucket"
    key          = "real-state-dynamodb/terraform.tfstate" # Caminho/nome do arquivo de estado dentro do bucket
    region       = "us-east-1"                             # Região AWS do seu bucket S3
    encrypt      = true                                    # Recomenda-se criptografar o estado (SSE-S3 por padrão)
    dynamodb_table = "terraform-lock-table"                 # Adiciona o uso da tabela de lock
  }
}