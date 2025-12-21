variable "sql_servers" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    admin    = string
    password = string
  }))
}

variable "sql_databases" {
  type = map(object({
    name          = string
    server_key   = string
    sku_name     = string
    license_type = string
    collation    = string
    enclave_type = string
    max_size_gb  = number
    tags         = map(string)
  }))
}
