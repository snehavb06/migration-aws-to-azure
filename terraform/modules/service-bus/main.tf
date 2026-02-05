resource "azurerm_servicebus_namespace" "this" {
  name                = "${var.project_name}-${var.environment}-sb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}

resource "azurerm_servicebus_queue" "queue" {
  name         = "app-queue"
  namespace_id = azurerm_servicebus_namespace.this.id

  max_delivery_count = 10
  enable_partitioning = true
}

resource "azurerm_servicebus_topic" "topic" {
  name         = "app-topic"
  namespace_id = azurerm_servicebus_namespace.this.id
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "sub" {
  name     = "app-subscription"
  topic_id = azurerm_servicebus_topic.topic.id

  max_delivery_count = 10
}
