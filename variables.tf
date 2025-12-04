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

variable "db_cad_company_table_name" {
  description = "Nome base da tabela DynamoDB para db-cad-company."
  type        = string
  default     = "db-cad-company" # Novo nome base
}
#   type        = string
#   default     = "outra-tabela"
# }