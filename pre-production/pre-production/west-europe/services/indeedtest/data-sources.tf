/*
data "azurerm_log_analytics_workspace" "ef-1-pr-euw-default-oms-01" {
provider            = azurerm.enabling_functions
name                = "ef-1-pr-euw-default-oms-01"
resource_group_name = "ef-1-pr-euw-oms-rsg-01"
}


data "azurerm_key_vault" "ss_1_pr_euw_autom_kvl_01" { 
  provider            = azurerm.shared_services
  name                = "ss-1-pr-euw-autom-kvl-01"
  resource_group_name = "ss-1-pr-euw-autom-rsg-01"
}

data "azurerm_key_vault_secret" "coopwintel2016password" {
  provider     = azurerm.shared_services
  name         = "CoopWintel2016Password"
  key_vault_id = data.azurerm_key_vault.ss_1_pr_euw_autom_kvl_01.id
}

data "azurerm_key_vault_secret" "svc_scorchpassword" {
  provider     = azurerm.shared_services
  name         = "Svc-ScorchPassword"
  key_vault_id = data.azurerm_key_vault.ss_1_pr_euw_autom_kvl_01.id
}
*/