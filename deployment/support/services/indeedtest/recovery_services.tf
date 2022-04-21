locals {
  rsv = distinct(flatten([for k, v in var.server_specifications : {
    name                         = v.tag_service_name
    tag_service_application_name = v.tag_service_application_name
    rsv_number                   = v.rsv_number
    }
  ]))
}
module "recovery_services_vault" {
  source                       = "../../../../modules/recovery_services_vault/"
  for_each                     = { for key in local.rsv : key.name => key }
  location                     = var.location
  sku                          = "Standard"
  resource_group_name          = module.resource_group[each.value.name].resource_group_name
  rsv_number                   = each.value.rsv_number
  service_name                 = each.value.name
  location_id                  = var.location_id
  tag_b_unit                   = var.tag_b_unit
  tag_cc                       = var.tag_cc
  tag_costcenter               = var.tag_costcenter
  tag_data_classification      = var.tag_data_classification
  tag_environment              = var.tag_environment
  tag_project_num              = var.tag_project_num
  tag_service_name             = each.value.name
  tag_deployment_ref           = var.tag_deployment_ref
  tag_service_application_name = each.value.tag_service_application_name
  tag_service_tier             = var.tag_service_tier
  b_unit_id                    = var.b_unit_id
  environment_id               = var.environment_id

  depends_on = [
    module.resource_group
  ]
}
module "virtual_machine_policy" {
  source              = "../../../../modules/recovery_services_vault/vm_policy/"
  for_each            = { for key in local.rsv : key.name => key }
  resource_group_name = module.resource_group[each.value.name].resource_group_name
  recovery_vault_name = module.recovery_services_vault[each.key].rsv_name

  depends_on = [
    module.recovery_services_vault
  ]
}

module "vm_addition" {
source            =  "../../../../modules/recovery_services_vault/vm_addition/"
for_each          =   var.server_specifications
resource_group_name = module.resource_group[each.value.tag_service_name].resource_group_name
recovery_vault_name = module.recovery_services_vault[each.value.tag_service_name].rsv_name
source_vm_id = module.support_virtual_machine[each.key].vm_id
backup_policy_id = module.virtual_machine_policy[each.value.tag_service_name].policy_id

depends_on = [
module.recovery_services_vault,
module.virtual_machine_policy,
module.support_virtual_machine  
]

}
