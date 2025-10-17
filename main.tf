terraform {
required_providers {
google = {
source = "hashicorp/google"
version = "~>6.0"
}
}
}
module "law" {
source = "./modules/log_analytics"
law_name = "patch-law"
location = var.location
resource_group_name = var.resource_group_name
}
module "automation" {
source = "./modules/automation_account"
automation_account_name = "patch-autoacct"
location = var.location
resource_group_name = var.resource_group_name
}
module "update_mgmt" {
source = "./modules/update_management"
law_id = module.law.law_id
automation_account_id = module.automation.automation_account_id
automation_account_name = "patch-autoacct"
resource_group_name = var.resource_group_name
}
resource "azurerm_automation_scheudle" "patch_scheudle" {
name = "weekly-patch"
resource_group_name = var.resource_group_name
automation_account_name = var.automation_account_name
frequency = "week"
interval = 1
start_time = "2025-10-18T02:00:002"
timezone = "India Standard Time"
}
