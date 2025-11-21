resource "azurerm_virtual_network" "venet" {
  for_each=var.venet
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}