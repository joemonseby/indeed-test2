resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                         = var.name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  computer_name                = var.computer_name
  size                         = var.size
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  network_interface_ids        = [azurerm_network_interface.primary_interface.id]  
  license_type                 = var.license_type
  zone                         = var.zone
  source_image_id              = var.source_image_id
  enable_automatic_updates     = var.enable_automatic_updates
  patch_mode                   = var.patch_mode
  provision_vm_agent           = var.provision_vm_agent
  custom_data                  = var.custom_data
  timezone                     = var.timezone
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  availability_set_id          = var.availability_set_id
  platform_fault_domain        = var.platform_fault_domain

 
  
  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities_ultra_ssd_enabled == null ? [] : [1] 
      content {
        ultra_ssd_enabled = var.additional_capabilities_ultra_ssd_enabled
      }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_storage_account_uri == null ? [] : [1] 
      content {
        storage_account_uri = var.boot_diagnostics_storage_account_uri
      }
  }

  os_disk {
    name                      = "${var.name}-OSdsk-01"
    caching                   = var.os_disk_caching
    storage_account_type      = var.os_disk_storage_account_type
    disk_size_gb              = var.os_disk_disk_size_gb
    write_accelerator_enabled = var.os_disk_write_accelerator_enabled
  }

  dynamic "source_image_reference" {
    for_each = var.source_image_id == null ? [1] : [] 
      content {
        publisher = var.source_image_reference_publisher
        offer     = var.source_image_reference_offer
        sku       = var.source_image_reference_sku
        version   = var.source_image_reference_version
      }
  }

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : [1] 
      content {
        type         = var.identity_type
        identity_ids = var.identity_identity_ids
      }
  }

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
  
    "powerManagementPlan" = var.power_management_plan
    "powerManagement"     = var.power_management
  }

}
output "vm_id" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine.id
}