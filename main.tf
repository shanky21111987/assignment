resource "azurerm_log_analytics_linked_service" "automation" {
resource_group_name = var.resource_group_name
workspace_id = var.law_id
linked_service_name = "Automation"
resource_id = var.automation_account_id
}
resource "azurerm_auotmation_update_configuration" "patch_schedule" {
name = "Patchschedule"
automation_account_name = var.automation_account_name
resource_group_name = var.resource_group_name
operating_system = "Windows"
duration = "PT2H"
reboot_setting = "IfRequired"
schedule_frequency = "week"
schedule_interval = 1
}
