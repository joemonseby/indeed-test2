locals {
  avl=distinct(flatten([for k,v in var.server_specifications:{
          name = v.tag_service_name
          tag_service_application_name = v.tag_service_application_name
          avl_number=v.avl_number
  }
  ]))
}
module "support_availability_set" {
  source = "../../../../modules/availability_set/"
 for_each = {for key in local.avl:"${key.name}.${key.avl_number}" =>key}
  resource_group_name = module.resource_group[each.value.name].resource_group_name
  location            = var.location
  service_name        = each.value.name
  location_id         = var.location_id
  avl_number          = each.value.avl_number
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