
 variable "storage_accounts" {
  type = map(object(
    {
      name       = string                # Name of the Resource Group
      location   = string                # Location Where RG will be created
      resource_group_name = string
      account_tier=string
      account_replication_type=string
      tags=optional(map(string))  
      account_kind  = optional(string)
  
    }
  ))
}
