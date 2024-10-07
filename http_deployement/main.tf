# Génération d'une chaîne aléatoire pour éviter les conflits de noms
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

# Création du plan App Service avec un nom unique
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.app_service_plan_name}-${random_string.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Création de l'App Service avec un nom unique
resource "azurerm_app_service" "app_service" {
  name                = "${var.app_service_name}-${random_string.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  app_settings = {
    "COSMOS_DB_ENDPOINT" = var.cosmos_db_endpoint
    "COSMOS_DB_KEY"      = var.cosmos_db_key
    "STORAGE_ACCOUNT"    = var.storage_account_name
  }

  site_config {
    always_on = true
  }
}
