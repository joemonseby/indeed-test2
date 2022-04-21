##################################################################################################################
# Global variables section
# Version : 3.0.0
# This section should be identical accross all modules and code
##################################################################################################################

# Note: These tags are a hybrid of v1 and v2 tags, this allows modules to use either types.

# CTP Manditory Tags - https://coopcloud.coop.co.uk/governance/tagging

#v1 tags

variable "tag_nominal_ledger" {
  type        = string
  description = "Mandatory Tag : Nominal ledger code for the cost-centre e.g. 1234"
  default     = null    
}

variable "tag_heat_id" {
  type        = string
  description = "v1 Mandatory Tag : Service Request ID from HEAT e.g. '1234567'"
  default     = null  
}

#v1/v2 tags

variable "tag_b_unit" {
  type        = string
  description = "v1/v2 Mandatory Tag : Name of Business Unit e.g. Shared Services, Retail, Funeralcare, Digital, Co-op Insurance, Enabling Functions, Legal Services"
}

variable "tag_cc" {
  type        = string
  description = "v1/v2 Mandatory Tag : Cost Centre number to which charges for the service(s) will be charged to e.g. 777764"
}

variable "tag_costcenter" {
type = string
description = "Cost centre number"
}
variable "tag_data_classification" {
  type        = string
  description = "v1/v2 Mandatory Tag : Sensitivity of data stored in the resource e.g. Confidential"
}

variable "tag_environment" {
  type        = string
  description = "v1/v2 Mandatory Tag : Working environment. e.g production, development"
}

variable "tag_project_num" {
  type        = string
  description = "v1/v2 Mandatory Tag : Project number that has requested the service(s) e.g. PR12345"
}

variable "tag_service_name" {
  type        = string
  description = "v1/v2 Mandatory Tag : Business Service name e.g. 'Manhattan'"
}

# v2

variable "tag_deployment_ref" {
  type        = string
  description = "v2 Mandatory Tag : Describes how the resource was deployed  e.g 'Terraform', 'Portal', 'Powershell'"
  default     = null
}

variable "tag_service_application_name" {
  type        = string
  description = "v2 Mandatory Tag : Descriptive name to identify what the resource relates to relative to the Service Name e.g. Web Server, Database Server etc."
  default     = null
}

variable "tag_service_tier" {
  type        = string
  description = "v2 Mandatory Tag : Service Tier for this service"
  default     = null
}

# Other global variables

variable "b_unit_id" {
  type        = string
  description = "Name ID for Business unit e.g ss, rt, fc"
}

variable "environment_id" {
  type        = string
  description = "Name ID for Enviroment e.g pr, dv"
}

##################################################################################################################
# Module specific variables
##################################################################################################################

variable "resource_group_name" {
  type        = string
  description = "Name of the pre-existing resource group for resource creation"
}

variable "location" {
  type        = string
  description = "Azure location for resource creation"
}

variable "service_name" {
  type        = string
  description = "Name of the service"
}

variable "location_id" {
  type        = string
  description = "Name ID for Location"
}

# vm

variable "name" {
  type        = string
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created"
}

variable "size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "zone" {
  description = "The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created"
  type        = string
  default     = null
}

variable "license_type" {
  description = "Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows_Client and Windows_Server."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "Admin account user that will be created with the VM"
  type        = string  
}

variable "admin_password" {
  description = "Password of the admin account, this must meet complexity requirments of the image"
  type        = string  
}

variable "source_image_id" {
  description = "The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string  
  default     = null
}

variable "availability_set_id" { 
  description = "availability set ID for the VM. Set this to 'null' if you do not wish to use one"
  type        = string
  default     = null
}

variable "enable_automatic_updates" { 
  description = " Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "computer_name" { 
  description = "Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "provision_vm_agent" {
  description = "Should the Azure Virtual Machine Guest Agent be installed on this Virtual Machine"
  default     = true
}

variable "patch_mode" { 
  description = "Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are Manual, AutomaticByOS and AutomaticByPlatform. Defaults to AutomaticByOS."
  type        = string
  default     = null
}

variable "timezone" { 
  description = "Specifies the Time Zone which should be used by the Virtual Machine, the possible values are defined here. https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/"
  type        = string
  default     = null
}

variable "virtual_machine_scale_set_id" { 
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "platform_fault_domain" { 
  description = "Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Windows Virtual Machine to be created."
  type        = number
  default     = null
}

# additional_capabilities block

variable "additional_capabilities_ultra_ssd_enabled" { 
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine? Defaults to false."
  type        = bool
  default     = null
}

# boot_diagnostics block

variable "boot_diagnostics_storage_account_uri" { 
  description = "The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. Passing a null value will utilize a Managed Storage Account to store Boot Diagnostics."
  type        = string
  default     = null
}

# os_disk block

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_caching" {
  description = "Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite"
  type        = string  
  default     = "ReadWrite"
}

variable "os_disk_disk_size_gb" {
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  type        = number  
  default     = null
}

variable "os_disk_write_accelerator_enabled" {
  description = "Should Write Accelerator be Enabled for this OS Disk? Defaults to false."
  type        = bool  
  default     = null
}

# source_image_reference block

variable "source_image_reference_publisher" {
  description = "OS Image publisher e.g MicrosoftWindowsServer"
  type        = string  
  default     = "MicrosoftWindowsServer"
}

variable "source_image_reference_offer" {
  description = "Publisher offer e.g WindowsServer"
  type        = string  
  default     = "WindowsServer"
}

variable "source_image_reference_sku" {
  description = "SKU of the image e.g 2016-Datacenter"
  type        = string  
  default     = "2016-Datacenter"
}

variable "source_image_reference_version" {
  description = "Version of image to use, e.g latest"
  type        = string  
  default     = "latest"
}

# identity

variable "identity_type" {
  description = "The type of Managed Identity which should be assigned to the Windows Virtual Machine. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned."
  type        = string  
  default     = null
}

variable "identity_identity_ids" {
  description = "A list of User Managed Identity ID's which should be assigned to the Windows Virtual Machine."
  type        = list(string)
  default     = null
}

# power management

variable "power_management_plan" {
  description = "Power management schedule settings, or 'null' "
  default     = null
}

variable "power_management" {
  description = "Power management settings and override valid settings are 'alwayson', 'alwayoff', 'override', 'alwaysoffschedule', or 'null'"
  default     = null
}

## network interface

variable "dns_servers" {
  description = "A list of IP Addresses defining the DNS Servers which should be used for this Network Interface. Configuring DNS Servers on the Network Interface will override the DNS Servers defined on the Virtual Network."
  type        = list(string)
  default     = null  
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled? Defaults to false."
  type        = bool
  default     = null  
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = null  
}

# ip_configuration block

variable "ip_configuration_subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in"
  type        = string
  default     = null  
}

variable "ip_configuration_private_ip_address_allocation" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  type        = string
  default     = "Static"
}

variable "ip_configuration_private_ip_address" {
  description = "When private_ip_address_allocation is set to Static the following fields can be configured: The Static IP Address which should be used."
  type        = string
  default     = null
}

variable "ip_configuration_public_ip_address_id" {
  description = "Reference to a Public IP Address to associate with this NIC"
  type        = string
  default     = null
}

# network sub-modules for association

variable "network_security_group_associate" {
  description = "Should we associate the NIC with a NSG, if this is true you must set network_security_group_id"
  type        = bool  
  default     = false
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group which should be attached to the Network Interface. Changing this forces a new resource to be created"
  type        = string  
  default     = null
}

variable "application_security_group_associate" {
  description = "Should we associate the NIC with a ASG, if this is true you must set application_security_group_id"
  type        = bool  
  default     = false
}

variable "application_security_group_id" {
  description = "The ID of the Application Security Group which this Network Interface which should be connected to. Changing this forces a new resource to be created."
  type        = string  
  default     = null
}

# sql server

variable  "sql_server_config" {
  default = {}
}