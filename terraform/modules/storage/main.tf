resource "azurerm_storage_account" "this" {
  name                     = lower(replace("${var.project_name}${var.environment}sa", "-", ""))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "reports" {
  name                  = "reports"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
