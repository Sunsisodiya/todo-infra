resource "azurerm_mssql_server" "server" {
  for_each = var.sql_servers

  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.rg_name
  version                      = "12.0"
  administrator_login          = each.value.admin
  administrator_login_password = each.value.password
}

resource "azurerm_mssql_database" "database" {
  for_each = var.sql_databases

  name      = each.value.name
  server_id = azurerm_mssql_server.server[
    each.value.server_key
  ].id

  sku_name     = each.value.sku_name
  license_type = each.value.license_type
  collation    = each.value.collation
  enclave_type = each.value.enclave_type
  max_size_gb  = each.value.max_size_gb

  tags = each.value.tags
}
