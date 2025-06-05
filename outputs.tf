output "db_cad_company_table_name" {
  description = "O nome da tabela DynamoDB db-cad-company"
  value       = aws_dynamodb_table.cad_company.name
}

output "db_cad_company_table_arn" {
  description = "O ARN da tabela DynamoDB db-cad-company"
  value       = aws_dynamodb_table.cad_company.arn
}

# Adicione outputs para outras tabelas se você as definir