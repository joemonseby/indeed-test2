
/*
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.90"

    }
  }
}
provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "enabling_functions"
  subscription_id = "d640670c-19a3-4883-bb4a-ddc6b7e628c7"
  features {}
}

*/

module "module_vm" {
  source                = "../../../../../deployment/support/services/indeedtest/"
  server_specifications = var.server_specifications
  vnet_name             = var.vnet_name
  #loadbalancer            = var.loadbalancer
  resource_group_name     = var.resource_group_name
  location                = var.location
  b_unit_id               = var.b_unit_id
  tag_b_unit              = var.tag_b_unit
  tag_cc                  = var.tag_cc
  tag_costcenter          = var.tag_costcenter
  tag_data_classification = var.tag_data_classification
  tag_environment         = var.tag_environment
  environment_id          = var.environment_id
  #tag_nominal_ledger       = var.tag_nominal_ledger
  tag_project_num = var.tag_project_num
  #tag_service_name          = var.tag_service_name
  #tag_heat_id                = var.tag_heat_id  
  tag_deployment_ref = var.tag_deployment_ref
  #tag_service_application_name = var.tag_service_application_name
  tag_service_tier            = var.tag_service_tier
  admin_username              = var.admin_username
  admin_password              = "Latest@12345" #data.azurerm_key_vault_secret.coopwintel2016password.value
  domain_join_password        = 12345          #data.azurerm_key_vault_secret.svc_scorchpassword.value
  log_analytics_workspace_id  = 12345          #data.azurerm_log_analytics_workspace.ef-1-pr-euw-default-oms-01.workspace_id
  log_analytics_workspace_key = 12345          #data.azurerm_log_analytics_workspace.ef-1-pr-euw-default-oms-01.primary_shared_key
}

/*
 provider "azurerm"{
    alias = "EasyAppTest"
    name = "AZWPPAPPEF010" 
  }

  provider "azurerm"{
    alias = "SQL-EASYTEST"
    name = "AZWPPDBSEF003" 
  }
  */
resource "azurerm_storage_account" "example" {
  name                     = "001efppeuwindeedstg"
  resource_group_name      = "ef-1-pp-euw-IndeedUAT-rsg-01"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "bUnit"                  = "Enabling Functions"
    "cc"                     = "777158"
    "costcenter"             = "777158"
    "dataClassification"     = "Confidential"
    "environment"            = "Pre-Production"
    "projectNum"             = "PR21-0783"
    "serviceName"            = "Indeed-UAT" ##TBC
    "deploymentRef"          = "Terraform"
    "serviceApplicationName" = "Indeed"
    "serviceTier"            = "SC3"
  }
#depends_on = [
 # module.module_vm
#]

}


resource "azurerm_storage_share" "example" {
  name                 = "share1"
  storage_account_name = azurerm_storage_account.example.name
  quota                = 5
}

/*resource "azurerm_storage_account" "example2" {
  name                     = "001efppeuweasydmsstg"
  resource_group_name      = "ef-1-pp-euw-easydms-rsg-01"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "bUnit"                  = "Enabling Functions"
    "cc"                     = "777717"
    "costcenter"             =  "777717"
    "dataClassification"     = "Confidential"
    "environment"            = "Pre-Production"
    #"nominalLedger"          = var.tag_nominal_ledger
    "projectNum"             = "PR21-0783"
    "serviceName"            = "easydms"
    #"heatID"                 = var.tag_heat_id  
    "deploymentRef"          = "Terraform"
    "serviceApplicationName" = "Easy_DMS"
    "serviceTier"            =  "SC3"      
  }

}

*/
