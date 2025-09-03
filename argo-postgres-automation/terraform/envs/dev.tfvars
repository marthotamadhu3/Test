location              = "eastus"
resource_group_name   = "rg-dev"
server_name           = "dev-postgres-srv"
admin_username        = "pgadmin"
sku_name              = "Standard_D2s_v3"
replication_enabled   = false
key_vault_name        = "shared-kv"
key_vault_secret_name = "pg-dev-password"
