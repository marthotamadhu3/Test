output "server_name" {
  value = azurerm_postgresql_flexible_server.db.name
}
output "admin_username" {
  value = azurerm_postgresql_flexible_server.db.administrator_login
}
output "key_vault_secret_id" {
  value = azurerm_key_vault_secret.db_admin_password.id
}
