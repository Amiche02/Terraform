resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

# Création du groupe de ressources
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Création du compte Cosmos DB
resource "azurerm_cosmosdb_account" "main" {
  name                = "${var.cosmos_db_name}-${random_string.random.result}" # Concaténation avec chaîne aléatoire
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  offer_type          = "Standard"
  kind                = "MongoDB"
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location          = azurerm_resource_group.main.location
    failover_priority = 0
  }
}

# Création du compte de stockage
resource "azurerm_storage_account" "main" {
  name                     = "${var.storage_account_name}${random_string.random.result}" # Concaténation avec chaîne aléatoire
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}