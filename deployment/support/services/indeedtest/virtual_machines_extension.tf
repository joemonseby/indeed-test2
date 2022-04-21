
module "support_virtual_machine_extension_join_domain" {
  source = "../../../../modules/virtual_machine_extension/"
  for_each = var.server_specifications  
  virtual_machine_id         = module.support_virtual_machine[each.key].vm_id
  name                       = "join-domain"
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true  

  settings = <<SETTINGS
    {
      "Name"    : "live.co-op.local",
      "OUPath"  : "OU=Application,OU=GT NEW,OU=Servers,DC=live,DC=co-op,DC=local",
      "User"    : "live\\svc-scorch",
      "Restart" : "true",
      "Options" : "3"
    }
  SETTINGS

  protected_settings =  <<PROTECTED_SETTINGS
    {
      "Password": "${var.domain_join_password}"
    }
  PROTECTED_SETTINGS

  tag_b_unit                   = var.tag_b_unit
  tag_cc                       = var.tag_cc
  tag_costcenter               = var.tag_costcenter  
  tag_data_classification      = var.tag_data_classification
  tag_environment              = var.tag_environment
  tag_project_num              = var.tag_project_num
  tag_service_name             = each.value.tag_service_name
  tag_deployment_ref           = var.tag_deployment_ref
  tag_service_application_name = each.value.tag_service_application_name
  tag_service_tier             = var.tag_service_tier

  b_unit_id                    = var.b_unit_id
  environment_id               = var.environment_id
 depends_on = [
   module.support_virtual_machine
 ]
}
module "support_virtual_machine_extension_monitoring_agent" {

  source = "../../../../modules/virtual_machine_extension/"

  for_each = var.server_specifications  

    virtual_machine_id         = module.support_virtual_machine[each.key].vm_id
    name                       = "microsoft-monitoring-agent"
    publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
    type                       = "MicrosoftMonitoringAgent"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = true

    settings = <<SETTINGS
      {
        "workspaceId"  : "${var.log_analytics_workspace_id}"
      }
    SETTINGS

    protected_settings = <<PROTECTED_SETTINGS
      {
        "workspaceKey" : "${var.log_analytics_workspace_key}"
      }
    PROTECTED_SETTINGS

    tag_b_unit                   = var.tag_b_unit
    tag_cc                       = var.tag_cc
    tag_costcenter               = var.tag_costcenter 
    tag_data_classification      = var.tag_data_classification
    tag_environment              = var.tag_environment
    tag_project_num              = var.tag_project_num
    tag_service_name             = each.value.tag_service_name
    tag_deployment_ref           = var.tag_deployment_ref
    tag_service_application_name = each.value.tag_service_application_name
    tag_service_tier             = var.tag_service_tier

    b_unit_id                    = var.b_unit_id
    environment_id               = var.environment_id
    depends_on = [
      module.support_virtual_machine
    ]

}
