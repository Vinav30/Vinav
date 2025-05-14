variable "main_rgs" {
  description = "A map of resource groups to create."
  type        = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))
  default     = {}
}

variable "main_stgs" {
  description = "A map of storage accounts to create."
  type        = map(object({
    name                     = string
    account_replication_type = string
    account_tier            = string
    location                = string
    resource_group_name      = string
    tags                    = optional(map(string))
  }))
  default     = {}
  
}

variable "main_vnets" {
  description = "A map of virtual networks to create."
  type        = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
  default     = {}
  
}

variable "main_subnets" {
  description = "A map of subnets to create."
  type        = map(object({
    name                = string
    address_prefixes    = list(string)
    resource_group_name = string
    virtual_network_name = string
  }))
  default     = {} 
}
variable "main_vms" {
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