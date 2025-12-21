module "rg" {
  source = "../../module/rg"
  rg     = var.rgs
}

module "network" {
  depends_on = [module.rg]
  source     = "../../module/networking"
  networks   = var.networks
}

module "public_ip" {
  depends_on = [module.rg]
  source     = "../../module/public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [module.rg]
  source     = "../../module/keyvault"
  key_vaults = var.key_vaults
}

module "sql" {
  depends_on = [module.key_vault]
  source = "../../module/sql"

  sql_servers   = var.sql_servers
  sql_databases = var.sql_databases
}




module "vms" {
  depends_on = [module.network, module.public_ip, module.key_vault]
  source     = "../../module/azure_vm"
  vms        = var.vms
}
