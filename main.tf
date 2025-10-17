resource "azurerm_log_analytics_workspace" "this" {
name = var.law_name
location = var.law_name
resource_group_name = var.resource_group_name
sku = "PerGB2018"
retention_in_days = 30
}
output "law_id" {
value = azurerm_log_analytics_workspace.this.id
}
