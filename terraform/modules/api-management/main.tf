resource "azurerm_api_management" "this" {
  name                = "${var.project_name}-${var.environment}-apim"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "Migration Team"
  publisher_email     = "admin@example.com"
  sku_name            = "Consumption_0"
}

resource "azurerm_api_management_api" "api" {
  name                = "backend-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.this.name
  revision            = "1"
  display_name        = "Backend API"
  path                = ""
  protocols           = ["https"]

  service_url = var.function_app_url
}

resource "azurerm_api_management_api_operation" "get" {
  operation_id        = "get-operation"
  api_name            = azurerm_api_management_api.api.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = var.resource_group_name
  display_name        = "Proxy Operation"
  method              = "GET"
  url_template        = "/{proxy+}"

  response {
    status_code = 200
  }
}
