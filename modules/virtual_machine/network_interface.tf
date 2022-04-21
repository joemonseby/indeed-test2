resource "azurerm_network_interface" "primary_interface" {
  name                          = "${var.name}-nic-01"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_servers                   = var.dns_servers
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                           = "ipconfig1"
    subnet_id                      = var.ip_configuration_subnet_id
    private_ip_address_allocation  = var.ip_configuration_private_ip_address_allocation
    private_ip_address             = var.ip_configuration_private_ip_address 
    public_ip_address_id           = var.ip_configuration_public_ip_address_id
  }

  tags = {
    "bUnit"                  = var.tag_b_unit
    "cc"                     = var.tag_cc
    "costcenter"             = var.tag_costcenter
    "dataClassification"     = var.tag_data_classification
    "environment"            = var.tag_environment
    "nominalLedger"          = var.tag_nominal_ledger
    "projectNum"             = var.tag_project_num
    "serviceName"            = var.tag_service_name
    "heatID"                 = var.tag_heat_id  
    "deploymentRef"          = var.tag_deployment_ref
    "serviceApplicationName" = var.tag_service_application_name
    "serviceTier"            = var.tag_service_tier       
  }
}

resource "azurerm_network_interface_application_security_group_association" "application_security_group_association" {
  network_interface_id          = azurerm_network_interface.primary_interface.id
  application_security_group_id = var.application_security_group_id
  
  count = var.application_security_group_associate == true ? 1 : 0
}

resource "azurerm_network_interface_security_group_association" "network_security_group_association" {
  network_interface_id      = azurerm_network_interface.primary_interface.id
  network_security_group_id = var.network_security_group_id
  count =  var.network_security_group_associate == true ? 1 : 0
}
output "nic_id" {
value = azurerm_network_interface.primary_interface.id
}