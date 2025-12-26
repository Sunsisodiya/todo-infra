data "azurerm_key_vault" "kv" {
    for_each = var.sql_servers
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "sql_password" {
    for_each = var.sql_servers
  name         = "sql-admin-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
