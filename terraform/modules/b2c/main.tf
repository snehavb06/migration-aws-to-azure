resource "azuread_application" "b2c_app" {
  display_name = "${var.project_name}-${var.environment}-b2c-app"
}

resource "azuread_service_principal" "b2c_sp" {
  application_id = azuread_application.b2c_app.application_id
}
