resource "azurerm_virtual_machine_extension" "virtual_machine_extension" {
  name                       = var.name
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = var.publisher
  type                       = var.type
  type_handler_version       = var.type_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  settings                   = var.settings
  protected_settings         = var.protected_settings

  tags = {
    "tag_b_Unit"                  = var.tag_b_unit
    "tag_cc"                     = var.tag_cc
    "tag_costcenter"             = var.tag_costcenter
    "tag_data_Classification"     = var.tag_data_classification
    "tag_environment"            = var.tag_environment
    "tag_nominal_ledger"          = var.tag_nominal_ledger
    "tag_project_num"             = var.tag_project_num
    "tag_service_name"            = var.tag_service_name
    "tag_heat_id"                 = var.tag_heat_id  
    "tag__deployment_ref"          = var.tag_deployment_ref
    "tag_service_application_name" = var.tag_service_application_name
    "tag_service_tier"            = var.tag_service_tier       
  }

}