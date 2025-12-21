output "server_ids" {
  value = {
    for k, v in azurerm_mssql_server.server : k => v.id
  }
}
