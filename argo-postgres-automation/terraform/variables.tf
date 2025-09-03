variable "location" {}
variable "resource_group_name" {}
variable "server_name" {}
variable "admin_username" {}
variable "sku_name" {}
variable "replication_enabled" {
  type    = bool
  default = false
}
variable "key_vault_name" {}
variable "key_vault_secret_name" {}
