module "module_rg" {
  source = "../../modules/azurerm_rg"
resource_groups= var.main_rgs
}
module "module_stg" {
  depends_on = [ module.module_rg ]
  source = "../../modules/azurerm_stg"
  storage_accounts = var.main_stgs
}
module "module_vnet" {
  depends_on = [ module.module_rg ]
  source = "../../modules/azurerm_vnet"
  virtual_networks = var.main_vnets
 
}
module "module_subnet" {
  depends_on = [ module.module_vnet ]
  source = "../../modules/azurerm_subnet"
  subnets = var.main_subnets 
}
module "module_linux_vm" {
  depends_on = [ module.module_subnet ]
  source = "../../modules/azurerm_linux_vm"
vms = var.main_vms
  
}