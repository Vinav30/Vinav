variable "storage_accounts" {
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