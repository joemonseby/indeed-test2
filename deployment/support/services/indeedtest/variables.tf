
/*variable "subnet_name" {
   type = string
}*/
variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}
variable "server_specifications" {
  type = map(object({
    size                         = string
    subnet                       = string
    os_disk_caching              = string
    os_storage_account_type      = string
    os_disk_size_gb              = number
    publisher                    = string
    offer                        = string
    sku                          = string
    version                      = string
    load_balancer                = string
    private_ip_address           = string
    tag_service_name             = string
    tag_service_application_name = string
    avl_number                   = number
    rsv_number                   = number
    managed_disks = map(object({
      disk_size_gb = number
    }))
  }))
}

/*
variable "loadbalancer" {
  type = list(object({
    ilb_number                     = string
    sku                            = string
    subnet_name                    = string
    private_ip_addresses           = list(string)
    tag_service_name               = string
    tag_service_application_name   = string
    backend_address_pool_name      = string
    frontend_ip_configuration_name = string
    probe_name                     = string
    lb_rule_name                   = string
  }))
}
*/
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
  type        = string
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



/*variable "tag_service_name" {
  type        = string
  description = "v1/v2 Mandatory Tag : Business Service name e.g. 'Manhattan'"
}
*/
# v2

variable "tag_deployment_ref" {
  type        = string
  description = "v2 Mandatory Tag : Describes how the resource was deployed  e.g 'Terraform', 'Portal', 'Powershell'"
  default     = null
}

/*variable "tag_service_application_name" {
  type        = string
  description = "v2 Mandatory Tag : Descriptive name to identify what the resource relates to relative to the Service Name e.g. Web Server, Database Server etc."
  default     = null
}*/

variable "tag_service_tier" {
  type        = string
  description = "v2 Mandatory Tag : Service Tier for this service"
  default     = null
}

variable "log_analytics_workspace_id" {

  type        = string
  description = "Log analytics worksapce id "
  default     = "12345"
}

variable "log_analytics_workspace_key" {
  type        = string
  description = "Log Analytics worksapce key"
  default     = "678910"
}

variable "admin_username" {
  type        = string
  description = "Local-adminusername"
}

variable "admin_password" {
  type        = string
  description = "Local-adminpassword"
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
variable "domain_join_password" {
  type = string

}

variable "location_id" {
  type    = string
  default = "euw"
}




