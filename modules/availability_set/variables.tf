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

variable "avl_number" {
  type        = number
  description = "Two digit ID to append to the name of the resource to create a unique name"
}

variable "platform_update_domain_count" {
  type        = number
  description = "Number of update domain"
  default     = 6
}

variable "platform_fault_domain_count" {
  type        = number  
  description = "Number of fault domain"
  default     = 3
}

variable "managed" {
  type        = bool  
  description = "Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is true."
  default     = true
}

variable "proximity_placement_group_id" {
  type        = string  
  description = "The ID of the Proximity Placement Group to which this Virtual Machine should be assigned. Changing this forces a new resource to be created."
  default     = null
}