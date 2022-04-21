resource "azurerm_backup_policy_vm" "policy" {
  name                = var.policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name

  timezone = var.timezone

  backup {
    frequency = var.frequency
    time      = var.time
  }

  retention_daily {
    count = var.retention_daily
  }

  retention_weekly {
    count    = var.retention_weekly
    weekdays = var.weekly_retention_weekdays
  }

  retention_monthly {
    count    = var.retention_monthly
    weekdays = var.monthly_retention_weekdays
    weeks    = var.monthly_retention_weeks
  }

  retention_yearly {
    count    = var.retention_yearly
    weekdays = var.yearly_retention_weekdays
    weeks    = var.yearly_retention_weeks
    months   = var.yearly_retention_months
  }

}