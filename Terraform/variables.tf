variable "location"{
  type = string
}

variable "rg_name"{
  type = string
}

variable "maquinasvirtuales" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    interface_name      = string
  }))
  default = {
    mv1 = {
        name                = "example-machine"
        resource_group_name = "rg-dnazareno"
        location            = "West Europe"
        size                = "Standard_F2"
        admin_username      = "adminuser"
        interface_name      = "aznic"
    }
  }
}

variable "maquinasvirtuales2" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    interface_name      = string
  }))
}

variable "subnet_id" {
  type = string
}

variable "weekly_secgroup" {
  type = string
  default = "dnazareno_secgroup"
}

variable "nic_name1" {
  type = string
  default = "dnazareno_aznic1"
}

variable "nic_name2" {
  type = string
  default = "dnazareno_aznic2"
}

variable "nic_ip_name" {
  type = string
  default = "dnazareno_ipconfig"
}

variable "nic_ip_private_ip_address_allocation" {
  type = string
  default = "Dynamic"
}

variable "vm_image_publisher" {
  type = string
  default = "Canonical"
}

variable "vm_image_offer" {
  type = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "vm_image_sku" {
  type = string
  default = "22_04-lts"
}

variable "vm_image_version" {
  type = string
  default = "latest"
}

variable "vm_disk_caching" {
  type = string
  default = "ReadWrite"
}

variable "vm_disk_storage_account_type" {
  type = string
  default = "Standard_LRS"
}

variable "lb_sku" {
  type = string
  default = "Basic"
}

variable "secret_password" {
  type = string
  default = "123@Abc"
}

variable "publicip_name1" {
  type = string
  default = "dnazareno_publicip1"
}

variable "publicip_allocation_method1" {
  type = string
  default = "Static"
}

variable "cr_name" {
  type = string
  default = "dnazarenocrprod"
}

variable "cr_name_dev" {
  type = string
  default = "dnazarenocrdev"
}

variable "cr_sku" {
  type = string
  default = "Basic"
}

variable "cr_admin_enabled" {
  type = bool
  default = true
}