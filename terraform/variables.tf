variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type    = string
  default = "East US"
}

variable "function_zip_path" {
  type = string
}

variable "cosmos_throughput" {
  type    = number
  default = 400
}

variable "redis_capacity" {
  type    = number
  default = 1
}

variable "service_bus_sku" {
  type    = string
  default = "Standard"
}
