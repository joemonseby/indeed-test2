# Data E:\
locals {
  disk_specifications = flatten([
    for server_key, server in var.server_specifications : [
      for disk_key, disk in server.managed_disks : {
        server_name                  = server_key
        lun                          = disk_key
        size_gb                      = disk.disk_size_gb
        tag_service_application_name = server.tag_service_application_name
        tag_service_name             = server.tag_service_name
      }
    ]
  ])
}

module "support_azurerm_managed_disk" {
  source = "../../../../modules/managed_disk/"
  for_each = {
    for disk in local.disk_specifications : "${disk.server_name}.${disk.lun}" => disk
  }
  name                = each.value.server_name
  virtual_machine_id  = module.support_virtual_machine[each.value.server_name].vm_id
  resource_group_name = module.resource_group[each.value.tag_service_name].resource_group_name
  location            = var.location
  lun                 = tonumber(each.value.lun)
  disk_size_gb        = each.value.size_gb

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

  b_unit_id      = var.b_unit_id
  environment_id = var.environment_id

  depends_on = [
    module.support_virtual_machine
  ]
}
