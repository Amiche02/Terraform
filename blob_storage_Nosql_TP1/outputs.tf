output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "cosmos_db_endpoint" {
  value = azurerm_cosmosdb_account.main.endpoint
}

output "primary_key" {
  value     = azurerm_cosmosdb_account.main.primary_key
  sensitive = true
}

output "secondary_key" {
  value     = azurerm_cosmosdb_account.main.secondary_key
  sensitive = true
}
