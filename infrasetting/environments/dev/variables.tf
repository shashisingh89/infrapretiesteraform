variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}
variable "storage_accounts" {}
variable "nic" {}
variable "venet" {}
variable "subnet" {}
variable "vmlinux" {}
variable "public_ips" {}
variable "key_vaults" {
  
}