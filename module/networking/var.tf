variable "networks" {
  type = map(object({
    name          = string
    address_space = list(string)
    location      = string
    rg_name       = string

    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}
