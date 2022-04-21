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
  description = "cost center against which we have to charge"
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

# Generic variables used across multiple resources

variable "location" {
  description = "Azure location to deploy resource"
}

variable "service_name" {
  description = "Name of the service"
}

variable "location_id" {
  description = "Name ID for Location"
}

# recovery services vault

variable "sku" {
  description = "Sets the vault's SKU. Possible values include: Standard, RS0."
  default     = "Standard"
}

variable "rsv_number" {
  description = "Two digit ID to append to the name of the resource to create a unique name"
  default     = 01
}

variable "resource_group_name" {
description = "rg-name"
type = string
}




