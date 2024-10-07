# main.tf

# Import du groupe de ressources déjà existant
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Plan App Service sur Linux (Ubuntu)
resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_service_plan_name}-${random_string.random.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"

  sku_name            = "B1"  # Remplacer par un SKU plus accessible comme B1 ou S1
}

# App Service sur Linux avec un nom unique
resource "azurerm_linux_web_app" "app_service" {
  name                = "${var.app_service_name}-${random_string.random.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  app_settings = {
    "COSMOS_DB_ENDPOINT" = var.cosmos_db_endpoint
    "COSMOS_DB_KEY"      = var.cosmos_db_key
    "STORAGE_ACCOUNT"    = var.storage_account_name
  }

  site_config {
    always_on = true
  }
}

# Génération d'une chaîne aléatoire pour éviter les conflits de noms
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}
