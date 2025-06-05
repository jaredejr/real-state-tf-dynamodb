# Projeto Terraform para Tabelas DynamoDB - Real State

Este projeto gerencia a infraestrutura de tabelas DynamoDB para a aplicação "Real State" usando Terraform.

## Pré-requisitos

Antes de começar, garanta que você tem o seguinte instalado:

*   [Terraform](https://www.terraform.io/downloads.html) (versão ~> 1.0)
*   [AWS CLI](https://aws.amazon.com/cli/) configurada com credenciais (perfil `development` ou configure conforme necessário).
*   (Opcional) LocalStack para testes locais.

## Estrutura do Projeto

*   `dynamodb.tf`: Define os recursos da tabela DynamoDB.
*   `variables.tf`: Declara as variáveis usadas no projeto.
*   `outputs.tf`: Define os outputs do Terraform (ex: nomes e ARNs das tabelas).
*   `providers.tf`: Configura o provedor AWS e a integração com LocalStack.
*   `locals.tf`: Define variáveis locais, como tags comuns.
*   `main.tf` (ou `versions.tf`): Pode ser usado para a configuração do backend Terraform e versões de provedores (atualmente em `providers.tf`).

## Configuração

1.  **Clone o repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd real-state-dynamodb
    ```

2.  **Configurar Variáveis (Opcional):**
    Você pode criar um arquivo `terraform.tfvars` para sobrescrever os valores padrão das variáveis definidas em `variables.tf`.
    Exemplo de `terraform.tfvars`:
    ```hcl
    aws_region          = "us-west-2"
    environment         = "prod"
    is_localstack_env   = false
    # dynamodb_table_name_db_cad_company = "my-custom-company-table"
    ```
    **Importante:** Não adicione arquivos `terraform.tfvars` com dados sensíveis ao Git. Use variáveis de ambiente ou outras formas seguras de gerenciar segredos.

## Uso

1.  **Inicialize o Terraform:**
    ```bash
    terraform init
    ```

2.  **Planeje a infraestrutura:**
    ```bash
    terraform plan
    ```

3.  **Aplique as mudanças:**
    ```bash
    terraform apply
    ```

4.  **Para destruir a infraestrutura (cuidado!):**
    ```bash
    terraform destroy
    ```

### Testando com LocalStack

Para usar com LocalStack, certifique-se de que o LocalStack está rodando.
Você pode definir a variável `is_localstack_env` para `true`:

```bash
terraform apply -var="is_localstack_env=true"
```
Ou crie um arquivo `local.tfvars` com `is_localstack_env = true` e use `terraform apply -var-file="local.tfvars"`. Lembre-se de adicionar `local.tfvars` ao seu `.gitignore`.

## Contribuindo

Por favor, leia `CONTRIBUTING.md` para detalhes sobre nosso código de conduta e o processo para submeter pull requests.

## Licença

Este projeto é licenciado sob a Licença XYZ - veja o arquivo `LICENSE.md` para detalhes.