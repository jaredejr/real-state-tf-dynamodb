variable "aws_region" {
  description = "Região AWS para implantar os recursos do DynamoDB"
  type        = string
  default     = "us-east-1"
}

variable "is_localstack_env" {
  description = "Flag para indicar se o ambiente é LocalStack."
  type        = bool
  default     = false
}

variable "project_name" {
  description = "Nome base para os recursos do projeto DynamoDB"
  type        = string
  default     = "real-state-data"
}

variable "environment" {
  description = "Ambiente de deploy (ex: dev, stg, prod)"
  type        = string
  default     = "dev"
}

variable "dynamodb_table_name_db_cad_company" {
  description = "Nome base da tabela DynamoDB para db-cad-company."
  type        = string
  default     = "db-cad-company" # Novo nome base
}

variable "s3_bucket_name" {
  description = "O nome do bucket S3 para armazenar os estados do Terraform. Deve ser globalmente único."
  type        = string
  # Exemplo: "meu-tf-backend-estados-12345"
  # É recomendado adicionar um sufixo aleatório ou identificador de conta para garantir a unicidade.
}

# Adicione outras variáveis para outras tabelas DynamoDB se necessário
# variable "dynamodb_table_name_outra_tabela" {
#   description = "Nome da tabela DynamoDB para outra_tabela."
#   type        = string
#   default     = "outra-tabela"
# }