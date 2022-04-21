resource "azurerm_managed_disk" "managed_disk" {
  name                  = "${var.name}-dsk-${format("%02d", var.lun)}" 
  location              = var.location
  resource_group_name   = var.resource_group_name
  storage_account_type  = var.storage_account_type
  create_option         = var.create_option
  disk_iops_read_write  = var.disk_iops_read_write
  disk_mbps_read_write  = var.disk_mbps_read_write
  disk_size_gb          = var.disk_size_gb
  image_reference_id    = var.image_reference_id
  os_type               = var.os_type
  source_resource_id    = var.source_resource_id
  source_uri            = var.source_uri
  storage_account_id    = var.storage_account_id
  tier                  = var.tier
  #zone                = var.zone
  network_access_policy = var.network_access_policy
  disk_access_id        = var.disk_access_id

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

resource "azurerm_virtual_machine_data_disk_attachment" "virtual_machine_data_disk_attachment" {
  managed_disk_id           = azurerm_managed_disk.managed_disk.id
  virtual_machine_id        = var.virtual_machine_id
  lun                       = var.lun
  caching                   = var.caching
  create_option             = var.attachment_create_option
  write_accelerator_enabled = var.write_accelerator_enabled
}