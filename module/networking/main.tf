resource "azurerm_virtual_network" "virtual_networks" {
  for_each            = var.networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnets" {
  for_each = {
    for subnet in flatten([
      for vnet_key, vnet in var.networks : [
        for s in vnet.subnets : {
          key              = "${vnet_key}-${s.name}"
          vnet_name        = vnet.name
          rg_name          = vnet.rg_name
          name             = s.name
          address_prefixes = s.address_prefixes
        }
      ]
    ]) : subnet.key => subnet
  }

  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}
