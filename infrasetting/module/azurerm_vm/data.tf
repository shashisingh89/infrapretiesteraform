/*data "azurerm_subnet" "subnet" {
  for_each             = var.vmlinux
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}*/

locals {
  all_subnets = flatten([
    for vm_key, vm in var.vmlinux : [
      for sn in vm.subnet_name : {
        vm_key = vm_key
        name   = sn.name
      }
    ]
  ])
}

data "azurerm_subnet" "subnet" {
  for_each = { for s in local.all_subnets : "${s.vm_key}-${s.name}" => s }

  name                 = each.value.name
  virtual_network_name = var.vmlinux[each.value.vm_key].vnet_name
  resource_group_name  = var.vmlinux[each.value.vm_key].rg_name
}


data "azurerm_public_ip" "pip" {
  for_each            = var.vmlinux
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}