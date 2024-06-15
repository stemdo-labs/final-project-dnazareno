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

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = "West Europe"
  resource_group_name = "rg-dnazareno-dvfinlab"
  dns_prefix          = "bootcampaks"
  sku_tier            = "Standard"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2s"
    # vnet_subnet_id  = azurerm_subnet.azsbn3.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_container_registry" "example" {
  name                = "crdnazareno"
  resource_group_name = "rg-dnazareno-dvfinlab"
  location            = "West Europe"
  sku                 = "Basic"
  admin_enabled       = true
}
