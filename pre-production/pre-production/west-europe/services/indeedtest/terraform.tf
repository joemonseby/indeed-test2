terraform {
  required_version = ">=0.15.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=1.4.0"
    }

  }

  backend "azurerm" {
    resource_group_name  = "ef-1-pr-euw-stg-rsg-00"
    storage_account_name = "0001ef1preuwstatestg"
    container_name       = "container1"
    key                  = "pre-production/pre-production/west-europe/services/indeedtest/terraform1.tfstate"
  }
}

  





provider "azurerm" {
  features {}
}

/*
provider "azurerm" {
  alias           = "enabling_functions"
  subscription_id = "d640670c-19a3-4883-bb4a-ddc6b7e628c7"
  features {}
}

provider "azurerm" {
  alias  = "shared_services"
  subscription_id = "8910b9f6-9f05-4462-8dd8-469009bd101c"
  features {}
}

*/




