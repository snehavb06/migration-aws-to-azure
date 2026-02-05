output "function_app_name" {
  value = azurerm_linux_function_app.this.name
}

output "function_app_url" {
  value = "https://${azurerm_linux_function_app.this.default_hostname}"
}
