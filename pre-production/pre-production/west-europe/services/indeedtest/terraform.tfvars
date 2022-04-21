resource_group_name = "ef-1-pr-euw-net-rsg-01"
vnet_name           = "ef-1-pr-euw-vnet-vnt-01"
location            = "West Europe"
server_specifications = {
  "AZWPPAPPEF012" = {
    sku                          = "2019-Datacenter"
    subnet                       = "ef-1-pp-euw-frnt-sub-01"
    publisher                    = "MicrosoftWindowsServer"
    offer                        = "WindowsServer"
    version                      = "latest"
    os_disk_caching              = "ReadWrite"
    os_disk_size_gb              = 128
    os_storage_account_type      = "Premium_LRS"
    size                         = "Standard_B2S"
    tag_service_name             = "IndeedUAT"
    load_balancer                = ""
    tag_service_application_name = "Indeed"
    private_ip_address           = "10.72.84.21" # needs to be changed #
    avl_number                   = 01
    rsv_number                   = 01
    managed_disks = {
      "01" = {
        disk_size_gb = 64
      }
    }
  },
  /*
  "AZWPPDBSEF003" = {
    sku = "sqldev"
    managed_disks = {
      "01" = {
        disk_size_gb = 128
      },
      "02" = {
        disk_size_gb = 64
      }
    }
    subnet                       = "ef-1-pp-euw-dbs-sub-01"
    publisher                    = "MicrosoftSQLserver"
    offer                        = "sql2019-ws2019"
    version                      = "latest"
    os_disk_caching              = "ReadWrite"
    os_disk_size_gb              = 128
    os_storage_account_type      = "Premium_LRS"
    size                         = "Standard_B2MS"
    tag_service_name             = "sqlhrlgl"###(TBC)
    load_balancer                = ""
    tag_service_application_name = "Enabling Functions HR Legal SQL 2019 Infrastrucure (Test)"
    private_ip_address           = "10.72.83.21" #needs to be changed 
    avl_number                   = 01
    rsv_number                   = 01
  }
  
  "AZWPRDBSEF005" = {
    sku = "sqldev"
    managed_disks = {
      "01" = {
        disk_size_gb = 1024
      },
      "02" = {
        disk_size_gb = 512
      }
    }
    subnet                       = "ef-1-pr-euw-dbs-sub-01"
    publisher                    = "MicrosoftSQLserver"
    offer                        = "sql2019-ws2019"
    os_disk_caching              = "ReadWrite"
    os_disk_size_gb              = 128
    os_storage_account_type      = "PremiumSSD_LRS"
    size                         = "Standard_D4S_v4"
    tag_service_name             = "EFFN"
    #load_balancer                = "01"
    tag_service_application_name = "EF Finance SQL"
    private_ip_address           = "10.72.80.136" # needs to be changed 
    avl_number                   = 02
    rsv_number                   = 01
  }
 */ 
}


b_unit_id               = "ef"
tag_b_unit              = "Enabling Functions"
tag_cc                  = "777158"
tag_costcenter          = "777158"
tag_data_classification = "Confidential"
tag_environment         = "Pre-Production"
tag_project_num         = "PR21-0783"
tag_deployment_ref      = "Terraform"
tag_service_tier        = "SC3"
environment_id          = "pp"
admin_username          = "coopwintel"
location_id             = "euw"


/*
loadbalancer = [
  {
    backend_address_pool_name      = "Key2LiveProd-Backendpool-01"
    frontend_ip_configuration_name = "AG-EFFN"
    ilb_number                     = "01"
    private_ip_addresses           = ["10.72.80.137"]
    sku                            = "Standard"
    subnet_name                    = "ef-1-pr-euw-dbs-sub-01"
    tag_service_application_name   = "EF Finance SQL"
    tag_service_name               = "EFFN"
    probe_name                     = "SQLKey2Live01Probe"
    lb_rule_name                   = "TCPsqlKey2Live01Rule"
}]
*/
