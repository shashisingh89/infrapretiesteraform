variable "vmlinux" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      rg_name                = string
      vnet_name              = string
      subnet_name            = list(object({
    name             = string
    address_prefixes = list(string)
  }))
      pip_name               = string
      name                = string
      size                   = string
      kv_name                = string          
      admin_username         = optional(string)
      admin_password         = optional( string)
      source_image_reference = map(string)
      tags= optional(map(string))
    }
  ))
}
