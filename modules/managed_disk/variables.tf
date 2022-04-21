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

variable "tag_costcenter"{
type =  string
description = "costcenter name"
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

variable "name" {
  type        = string    
  description = "Specifies the name of the Managed Disk. Changing this forces a new resource to be created."
}

variable "lun" {
  type        = number  
  description = "Disks names must have a two digit number appended to their name to make them unique. A LUN ID is also required to attach the disk to a VM. Note 00 is reserved for the OS. Phew"
}

variable "storage_account_type" {
  type        = string  
  description = "The type of storage to use for the managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
  default     = "Premium_LRS"
}

variable "create_option" {
  type        = string  
  description = "The method to use when creating the managed disk. Changing this forces a new resource to be created. Possible values include:"
  default     = "Empty"
}

# Import - Import a VHD file in to the managed disk (VHD specified with source_uri).
# Empty - Create an empty managed disk.
# Copy - Copy an existing managed disk or snapshot (specified with source_resource_id).
# FromImage - Copy a Platform Image (specified with image_reference_id)
# Restore - Set by Azure Backup or Site Recovery on a restored disk (specified with source_resource_id).

variable "disk_iops_read_write" {
  type        = string  
  description = "The number of IOPS allowed for this disk; only settable for UltraSSD disks. One operation can transfer between 4k and 256k bytes."
  default     = null
}

variable "disk_mbps_read_write" {
  type        = string  
  description = "The bandwidth allowed for this disk; only settable for UltraSSD disks. MBps means millions of bytes per second."
  default     = null  
}

variable "disk_size_gb" {
  type        = number  
  description = "(Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
}

variable "image_reference_id" {
  type        = string  
  description = "ID of an existing platform/marketplace disk image to copy when create_option is FromImage."
  default     = null
}

variable "os_type" {
  type        = string  
  description = "Specify a value when the source of an Import or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows."
  default     = null  
}

variable "source_resource_id" {
  type        = string  
  description = "The ID of an existing Managed Disk to copy create_option is Copy or the recovery point to restore when create_option is Restore"
  default     = null  
}

variable "source_uri" {
  type        = string  
  description = "URI to a valid VHD file to be used when create_option is Import."
  default     = null  
}

variable "storage_account_id" {
  type        = string  
  description = "The ID of the Storage Account where the source_uri is located. Required when create_option is set to Import. Changing this forces a new resource to be created."
  default     = null  
}

variable "tier" {
  type        = string  
  description = "The disk performance tier to use. Possible values are documented here. This feature is currently supported only for premium SSDs."
  default     = null  
}

variable "zone" {
  type        = list(string)
  description = "A collection containing the availability zone to allocate the Managed Disk in."
  default     = null  
}

variable "network_access_policy" {
  type        = string  
  description = "Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll."
  default     = null  
}

variable "disk_access_id" {
  type        = string  
  description = "The ID of the disk access resource for using private endpoints on disks."
  default     = null  
}

# attachment

variable "virtual_machine_id" {
  type        = string    
  description = "The ID of the Virtual Machine to which the Data Disk should be attached"
}

variable "caching" {
  description = "Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite"
  default     = "ReadWrite"
}

variable "attachment_create_option" {
  description = "The Create Option of the Data Disk, such as Empty or Attach. Defaults to Attach. Changing this forces a new resource to be created."
  default     = null
}

variable "write_accelerator_enabled" {
  description = "Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs. Defaults to false."
  default     = null
}
