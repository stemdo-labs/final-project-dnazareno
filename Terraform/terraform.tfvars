location = "West Europe"
existent_resource_group_name = "rg-dnazareno-dvfinlab"

maquinasvirtuales = {
    mv1 = {
        name                = "vmmysql"
        resource_group_name = "rg-dnazareno-dvfinlab"
        location            = "West Europe"
        size                = "Standard_B1ms"
        admin_username      = "vm1user"
        interface_name      = "dnazareno_aznic1"
    }
  }

maquinasvirtuales2 = {
    mv1 = {
        name                = "vmbackup"
        resource_group_name = "rg-dnazareno-dvfinlab"
        location            = "West Europe"
        size                = "Standard_B1ms"
        admin_username      = "vm2user"
        interface_name      = "dnazareno_aznic2"
    }
}