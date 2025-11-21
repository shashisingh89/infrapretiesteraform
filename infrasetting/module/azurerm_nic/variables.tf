variable "nic" {
  description = "Map of NICs, each with its IP configuration(s)"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = map(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation  = string
    }))
  }))
}
