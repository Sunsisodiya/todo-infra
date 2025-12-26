variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "networks" {}
variable "public_ips" {}
variable "key_vaults" {

}
variable "vms" {
  type = map(object({
    nic_name    = string
    location    = string
    rg_name     = string
    vnet_name   = string
    subnet_name = string
    pip_name    = string
    vm_name     = string
    size        = string
    # admin_username         = string
    # admin_password         = string
    kv_name                = optional(string)
    source_image_reference = map(string)
  }))
}

variable "sql_servers" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    admin    = string
    # password = string
  }))
}

variable "sql_databases" {
  type = map(object({
    name         = string
    server_key   = string
    sku_name     = string
    license_type = string
    collation    = string
    enclave_type = string
    max_size_gb  = number
    tags         = map(string)
  }))
}
