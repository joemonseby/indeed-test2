resource "azurerm_resource_group" "resource_group" {
  name     = "${var.b_unit_id}-1-${var.environment_id}-${var.location_id}-${var.service_name}-rsg-${format("%02d",var.rsg_number)}"
  location = var.location

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