terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
  # backend "azurerm" {
  #     resource_group_name  = "rg-dnazareno-dvfinlab"
  #     storage_account_name = "sta1dnazareno"
  #     container_name       = "tfstateweekly"
  #     key                  = "terraform_weekly.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "azvn" {
  name                = var.network_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.existent_resource_group_name
}

resource "azurerm_subnet" "azsbn" {
  name                 = var.weekly_subred
  resource_group_name  = var.existent_resource_group_name
  virtual_network_name = azurerm_virtual_network.azvn.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_subnet" "azsbn2" {
  name                 = var.weekly_subred2
  resource_group_name  = var.existent_resource_group_name
  virtual_network_name = azurerm_virtual_network.azvn.name
  address_prefixes     = var.subnet_address_prefixes2
}

resource "azurerm_public_ip" "publicip" {
    name                    = "testPublicIP"
    location                = var.location
    resource_group_name     = var.existent_resource_group_name
    allocation_method       = "Dynamic"
}

resource "azurerm_public_ip" "publicip2" {
    name                    = "testPublicIP2"
    location                = var.location
    resource_group_name     = var.existent_resource_group_name
    allocation_method       = "Dynamic"
}

resource "azurerm_network_security_group" "aznsc" {
  name                = var.weekly_secgroup
  location            = var.location
  resource_group_name = var.existent_resource_group_name

  # security_rule {
  #   name                       = var.nsc_secrule_name
  #   priority                   = var.nsc_secrule_priority
  #   direction                  = var.nsc_secrule_direction
  #   access                     = var.nsc_secrule_access
  #   protocol                   = var.nsc_secrule_protocol
  #   source_port_range          = var.nsc_secrule_source_port_range
  #   destination_port_range     = var.nsc_secrule_destination_port_range
  #   source_address_prefix      = var.nsc_secrule_source_address_prefix
  #   destination_address_prefix = var.nsc_secrule_destination_address_prefix
  # }
  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "sshtest"
    priority                   = 1101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "aznic" {
  name                = "aznic"
  location            = var.location
  resource_group_name = var.existent_resource_group_name
  ip_configuration {
    name                          = var.nic_ip_name
    subnet_id                     = azurerm_subnet.azsbn.id
    private_ip_address_allocation = var.nic_ip_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_network_interface" "aznic2" {
  name                = "aznic2"
  location            = var.location
  resource_group_name = var.existent_resource_group_name
  ip_configuration {
    name                          = var.nic_ip_name
    subnet_id                     = azurerm_subnet.azsbn2.id
    private_ip_address_allocation = var.nic_ip_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.publicip2.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.aznic.id
  network_security_group_id = azurerm_network_security_group.aznsc.id
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example2" {
  network_interface_id      = azurerm_network_interface.aznic2.id
  network_security_group_id = azurerm_network_security_group.aznsc.id
}

resource "azurerm_linux_virtual_machine" "db" {
  depends_on = [ azurerm_network_interface.aznic ]
  for_each = var.maquinasvirtuales
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.aznic.id,
  ]
  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }
  os_disk {
    caching              = var.vm_disk_caching
    storage_account_type = var.vm_disk_storage_account_type
  }
  disable_password_authentication = false
  admin_password = var.secret_password
}

resource "azurerm_linux_virtual_machine" "backup" {
  depends_on = [ azurerm_network_interface.aznic2 ]
  for_each = var.maquinasvirtuales2
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.aznic2.id,
  ]
  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }
  os_disk {
    caching              = var.vm_disk_caching
    storage_account_type = var.vm_disk_storage_account_type
  }
  disable_password_authentication = false
  admin_password = var.secret_password
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = var.location
  resource_group_name = var.existent_resource_group_name
  dns_prefix          = "bootcampaks"
  sku_tier            = "Standard"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2s"
    # vnet_subnet_id  = azurerm_subnet.azsbn.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


