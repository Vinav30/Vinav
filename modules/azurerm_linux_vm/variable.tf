variable "vms" {
description = "values for virtual machines"
type = map(object({
    vm_name                = string
    location            = string
    resource_group_name = string
    virtual_network_name = string
    subnet_name         = string
    admin_username      = string
    admin_password      = string
   nic_name             = string
   vm_size             = string
   ip_configuration= object({
     name                          = string
     private_ip_address_allocation = string
   })
  }))
  default     = {}
}