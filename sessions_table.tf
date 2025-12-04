# Tabela para armazenar sessões de usuário (sessionId -> tokens)
resource "aws_dynamodb_table" "sessions" {
  name         = "real-state-sessions-${terraform.workspace}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "sessionId"

  attribute {
    name = "sessionId"
    type = "S"
  }

  # Habilita Time to Live (TTL) para expirar sessões automaticamente
  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = {
    Name        = "real-state-sessions-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

output "sessions_table_name" {
  description = "O nome da tabela DynamoDB para sessões."
  value       = aws_dynamodb_table.sessions.name
}