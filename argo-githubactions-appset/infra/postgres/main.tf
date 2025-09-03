provider "azurerm" {
  features {}
}

variable "environment" {}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = "pg-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  administrator_login = "pgadmin"
  administrator_password = random_password.postgres.result
  version             = "14"
  sku_name            = var.environment == "prod" ? "GP_Standard_D4s_v3" : "B_Standard_B1ms"
  high_availability {
    mode = var.environment == "prod" ? "ZoneRedundant" : "Disabled"
  }
}

resource "random_password" "postgres" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "postgres-password" {
  name         = "postgres-${var.environment}-password"
  value        = random_password.postgres.result
  key_vault_id = azurerm_key_vault.existing.id
}

output "postgres_host" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "postgres_password_secret" {
  value = azurerm_key_vault_secret.postgres-password.name
}
