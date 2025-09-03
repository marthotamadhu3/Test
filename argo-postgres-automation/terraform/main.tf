provider "azurerm" {
  features {}
}

resource "azurerm_postgresql_flexible_server" "db" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = random_password.db_password.result
  sku_name            = var.sku_name

  storage_mb = 32768

  high_availability {
    mode = var.replication_enabled ? "ZoneRedundant" : "Disabled"
  }
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "db_admin_password" {
  name         = var.key_vault_secret_name
  value        = random_password.db_password.result
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault" "existing" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}
