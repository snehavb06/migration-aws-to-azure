resource "azurerm_application_insights" "this" {
  name                = "${var.project_name}-${var.environment}-appi"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}
