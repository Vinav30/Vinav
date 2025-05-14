variable "subnets" {
  description = "values for subnets"
  type = map(object({
    name             = string
    address_prefixes = list(string)
    resource_group_name = string
    virtual_network_name = string
  }))
  default     = {}
}