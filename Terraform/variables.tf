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
  default = "dnazareno_network"
}

variable "weekly_subred" {
  type = string
  default = "dnazareno_subred"
}

variable "weekly_subred2" {
  type = string
  default = "dnazareno_subred2"
}

variable "weekly_subred3" {
  type = string
  default = "dnazareno_subred3"
}

variable "weekly_secgroup" {
  type = string
  default = "dnazareno_secgroup"
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

variable "aks_name" {
  type = string
  default = "dnazarenoaks"
}

variable "aks_dns_prefix" {
  type = string
  default = "bootcampaks"
}

variable "aks_sku_tier" {
  type = string
  default = "Standard"
}

variable "aks_node_name" {
  type = string
  default = "default"
}

variable "aks_node_temporary_name" {
  type = string
  default = "rotation"
}

variable "aks_node_count" {
  type = number
  default = 1
}

variable "aks_node_vm_size" {
  type = string
  default = "Standard_B2s"
}

variable "aks_network_plugin" {
  type = string
  default = "azure"
}

variable "aks_network_service_cidr" {
  type = string
  default = "10.0.4.0/24"
}

variable "aks_network_dns_service_ip" {
  type = string
  default = "10.0.4.10"
}

variable "aks_identity_type" {
  type = string
  default = "SystemAssigned"
}

variable "aks_tags_environment" {
  type = string
  default = "Production"
}

variable "cr_name" {
  type = string
  default = "dnazarenocr"
}

variable "cr_sku" {
  type = string
  default = "Basic"
}

variable "cr_admin_enabled" {
  type = bool
  default = true
}