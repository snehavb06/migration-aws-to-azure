output "api_gateway_url" {
  value = module.api_management.gateway_url
}

output "function_app_url" {
  value = module.functions.function_app_url
}

output "cosmosdb_endpoint" {
  value = module.cosmosdb.endpoint
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "redis_hostname" {
  value = module.redis_cache.hostname
}

output "service_bus_namespace" {
  value = module.service_bus.namespace_name
}

output "key_vault_uri" {
  value = module.key_vault.vault_uri
}
