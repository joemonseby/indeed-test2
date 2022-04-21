##################################################################################################################
# Module specific variables
##################################################################################################################

variable "policy_name" {
  description = "Name of the backup policy"
  default = "Coop-Default"
}

variable "resource_group_name" {
  description = "Name of the pre-existing resource group for resource creation"
}

variable "recovery_vault_name" {
  description = "Name of the recovery service vault to create the policy in"
}

variable "timezone" {
  description = "Specifies the timezone. Defaults to UTC"
  default = "UTC"
}

variable "frequency" {
  description = "Sets the backup frequency. Must be either Daily or Weekly."
  default = "Daily"
}

variable "time" {
  description = "The time of day to perform the backup in 24hour format."
  default = "20:00"
}

variable "retention_daily" {
  description = "The number of daily backups to keep. Must be between 1 and 9999"
  default = "14"
}

variable "retention_weekly" {
  description = "The number of weekly backups to keep. Must be between 1 and 9999"
  default = "4"
}

variable "weekly_retention_weekdays" {
  description = "The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."
  default = ["Sunday"]
}

variable "retention_monthly" {
  description = "The number of monthly backups to keep. Must be between 1 and 9999"
  default = "3"
}

variable "monthly_retention_weekdays" {
  description = "The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."
  default = ["Sunday"]
}

variable "monthly_retention_weeks" {
  description = "The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last."
  default = ["First"]
}

variable "retention_yearly" {
  description = "The number of yearly backups to keep. Must be between 1 and 9999"
  default = 1
}

variable "yearly_retention_weekdays" {
  description = "The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."
  default = ["Sunday"]
}

variable "yearly_retention_weeks" {
  description = "The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last."
  default = ["First"]
}

variable "yearly_retention_months" {
  description = "The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, Augest, September, October, November and December."
  default = ["January"]
}