resource "azurerm_service_plan" "this" {
  name                = "${var.project_name}-${var.environment}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan for Functions
}

resource "azurerm_linux_function_app" "this" {
  name                        = "${var.project_name}-${var.environment}-func"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = azurerm_service_plan.this.id
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  functions_extension_version = "~4"

  site_config {
    application_stack {
      node_version = "18"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME           = "node"
    WEBSITE_RUN_FROM_PACKAGE          = "1"
    APPINSIGHTS_INSTRUMENTATIONKEY     = var.app_insights_key
  }

  zip_deploy_file = var.function_zip_path
}
