location = "UK South"
rg_name = "rg-dnazareno"
subnet_id = "/subscriptions/86f76907-b9d5-46fa-a39d-aff8432a1868/resourceGroups/final-project-common/providers/Microsoft.Network/virtualNetworks/vnet-common-bootcamp/subnets/sn-dnazareno"

maquinasvirtuales = {
    mv1 = {
        name                = "vmmysql"
        resource_group_name = "rg-dnazareno"
        location            = "UK South"
        size                = "Standard_B1ms"
        admin_username      = "vm1user"
        interface_name      = "dnazareno_aznic1"
    }
  }

maquinasvirtuales2 = {
    mv1 = {
        name                = "vmbackup"
        resource_group_name = "rg-dnazareno"
        location            = "UK South"
        size                = "Standard_B1ms"
        admin_username      = "vm2user"
        interface_name      = "dnazareno_aznic2"
    }
}