variable "location"{
  type = string
}

variable "existent_resource_group_name"{
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
        resource_group_name = "rg-dnazareno-dvfinlab"
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

variable "network_name" {
  type = string
  default = "weekly_network"
}

variable "weekly_subred" {
  type = string
  default = "weekly_subred"
}

variable "weekly_subred2" {
  type = string
  default = "weekly_subred2"
}

variable "weekly_subred3" {
  type = string
  default = "weekly_subred3"
}

variable "weekly_secgroup" {
  type = string
  default = "weekly_secgroup"
}

variable "weekly_lb" {
  type = string
  default = "weekly_lb"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "subnet_address_prefixes2" {
  type = list(string)
  default = ["10.0.2.0/24"]
}

variable "subnet_address_prefixes3" {
  type = list(string)
  default = ["10.0.3.0/24"]
}

variable "nsc_secrule_name" {
  type = string
  default = "web"
}

variable "nsc_secrule_priority" {
  type = number
  default = 1008
}

variable "nsc_secrule_access" {
  type = string
  default = "Allow"
}

variable "nsc_secrule_protocol" {
  type = string
  default = "Tcp"
}

variable "nsc_secrule_source_port_range" {
  type = string
  default = "*"
}

variable "nsc_secrule_destination_port_range" {
  type = string
  default = "80"
}

variable "nsc_secrule_source_address_prefix" {
  type = string
  default = "*"
}

variable "nsc_secrule_destination_address_prefix" {
  type = string
  default = "10.0.1.0/24"
}

variable "nsc_secrule_direction" {
  type = string
  default = "Inbound"
}

variable "nic_ip_name" {
  type = string
  default = "ipconfig"
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

variable "vm_ssh_public_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "lb_sku" {
  type = string
  default = "Basic"
}

variable "lb_front_ip_name" {
  type = string
  default = "frontend-ip"
}

variable "lb_front_ip_private_ip_address_allocation" {
  type = string
  default = "Dynamic"
}

variable "lb_backend_address_pool_name" {
  type = string
  default = "test-pool"
}

variable "secret_password" {
  type = string
  default = "123@Abc"
}