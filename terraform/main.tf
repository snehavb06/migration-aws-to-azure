resource "azurerm_resource_group" "this" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}

module "storage" {
  source              = "./modules/storage"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}

module "key_vault" {
  source              = "./modules/key-vault"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  throughput          = var.cosmos_throughput
}

module "service_bus" {
  source              = "./modules/service-bus"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.service_bus_sku
}

module "redis_cache" {
  source              = "./modules/redis-cache"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  capacity            = var.redis_capacity
}

module "monitoring" {
  source              = "./modules/monitoring"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
}

module "functions" {
  source                      = "./modules/functions"
  project_name                = var.project_name
  environment                 = var.environment
  location                    = var.location
  resource_group_name         = azurerm_resource_group.this.name
  storage_account_name        = module.storage.storage_account_name
  storage_account_access_key  = module.storage.storage_account_access_key
  app_insights_key            = module.monitoring.instrumentation_key
  function_zip_path           = var.function_zip_path
}

module "api_management" {
  source              = "./modules/api-management"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  function_app_name   = module.functions.function_app_name
  function_app_url    = module.functions.function_app_url
}

module "b2c" {
  source       = "./modules/b2c"
  project_name = var.project_name
  environment  = var.environment
}
