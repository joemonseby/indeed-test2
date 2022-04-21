locals {
  rg_name = distinct(flatten([for k, v in var.server_specifications : {
    name                         = v.tag_service_name
    tag_service_application_name = v.tag_service_application_name
    }
  ]))
}
module "resource_group" {
  source                       = "../../../../modules/resource_group/"
  for_each                     = { for key in local.rg_name : key.name => key }
  location                     = var.location
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
}

