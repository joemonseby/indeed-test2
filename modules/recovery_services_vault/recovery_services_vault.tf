resource "azurerm_recovery_services_vault" "vault" {
  name                      = "${var.b_unit_id}-1-${var.environment_id}-${var.location_id}-${var.service_name}-rsv-${format("%02d",var.rsv_number)}"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku                       = var.sku

  tags = {
    bUnit                   = var.tag_b_unit
    cc                      = var.tag_cc
    costcenter              = var.tag_costcenter
    dataClassification      = var.tag_data_classification
    deploymentRef           = var.tag_deployment_ref
    environment             = var.tag_environment
    projectNum              = var.tag_project_num
    serviceName             = var.tag_service_name
    serviceApplicationName  = var.tag_service_application_name
    serviceTier             = var.tag_service_tier
  }
}
output "rsv_name" {
value = azurerm_recovery_services_vault.vault.name  
}
