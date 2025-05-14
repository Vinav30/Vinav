variable "virtual_networks" {
  description = "values for virtual networks"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    subnets             = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}
