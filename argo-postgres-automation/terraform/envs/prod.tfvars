location              = "eastus"
resource_group_name   = "rg-prod"
server_name           = "prod-postgres-srv"
admin_username        = "pgadmin"
sku_name              = "Standard_D4s_v3"
replication_enabled   = true
key_vault_name        = "shared-kv"
key_vault_secret_name = "pg-prod-password"
