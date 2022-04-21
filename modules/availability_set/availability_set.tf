resource "azurerm_availability_set" "availability_set" {
  name                         = "${var.b_unit_id}-1-${var.environment_id}-${var.location_id}-${var.service_name}-avl-${format("%02d",var.avl_number)}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count  = var.platform_fault_domain_count
  managed                      = var.managed
  proximity_placement_group_id = var.proximity_placement_group_id

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