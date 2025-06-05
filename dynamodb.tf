resource "aws_dynamodb_table" "cad_company" {
  name         = "${var.dynamodb_table_name_db_cad_company}-${var.environment}" # Usa a nova variável para o nome base
  billing_mode = "PAY_PER_REQUEST"                                             # Ou PROVISIONED

  attribute {
    name = "PK" # Partition Key da tabela
    type = "S" # S para String, N para Number, B para Binary
  }
  attribute {
    name = "SK" # Sort Key da tabela
    type = "S"
  }
  attribute {
    name = "GSI1PK" # Partition Key do GSI1
    type = "S"
  }
  attribute {
    name = "GSI1SK" # Sort Key do GSI1
    type = "S"
  }
  attribute {
    name = "GSI2PK" # Partition Key do GSI2
    type = "S"
  }
  attribute {
    name = "GSI2SK" # Sort Key do GSI2
    type = "S"
  }

  # Chave primária da tabela
  hash_key  = "PK"
  range_key = "SK"

  # Índices Secundários Globais (GSIs)
  global_secondary_index {
    name            = "GSI1"
    hash_key        = "GSI1PK"
    range_key       = "GSI1SK"
    projection_type = "ALL" # Ou KEYS_ONLY, INCLUDE
    # read_capacity e write_capacity são ignorados se billing_mode = "PAY_PER_REQUEST"
  }

  global_secondary_index {
    name            = "GSI2"
    hash_key        = "GSI2PK"
    range_key       = "GSI2SK"
    projection_type = "ALL"
    # read_capacity e write_capacity são ignorados se billing_mode = "PAY_PER_REQUEST"
  }

  tags = local.common_tags

  # O lifecycle prevent_destroy é uma boa prática para tabelas DynamoDB em produção
  # para evitar exclusão acidental. Você pode habilitá-lo conforme necessário.
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# Defina outros recursos aws_dynamodb_table aqui para outras tabelas