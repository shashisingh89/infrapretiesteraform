module "resource_group" {
 source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
 }

 module "storage_accounts" {
    depends_on = [ module.resource_group ]
    source = "../../module/azurerm_storage_account"
    storage_accounts = var.storage_accounts
}


module "venet" {
depends_on = [ module.resource_group ]
  source   = "../../module/azurerm_venet"
  venet = var.venet
}

module "subnet" {
depends_on = [module.venet ]
  source   = "../../module/azurerm_subnet"
  subnet = var.subnet
}
/*
module "nic" {
depends_on = [ module.resource_group, module.subnet ]
  source   = "../../module/azurerm_nic"
  nic = var.nic
}*/

module "azurevm" {
depends_on = [module.keyvault , module.publicip , module.subnet ]
  source   = "../../module/azurerm_vm"
  vmlinux = var.vmlinux
}



module "publicip" {
depends_on = [ module.resource_group ]
  source     = "../../module/azurerm_public_ip"
  public_ips = var.public_ips
}

module "keyvault" {
    depends_on = [ module.resource_group ]
  source     = "../../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "sqlserver" {
  depends_on     = [module.resource_group]
  source          = "../../module/azurerm_sql_server"
  sql_server_name = "sql-shashi-dev-20-todoap-9879-centralindia"
  rg_name         = "rg-shashi-dev-todoapp-01"
  location        = "centralindia"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssw01rd@123"
  tags            = {}
}

module "sqldb" {
  depends_on  = [module.sqlserver]
  source      = "../../module/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = module.sqlserver.server_id
  max_size_gb = "2"
  tags        = {}
}