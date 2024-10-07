output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "cosmos_db_endpoint" {
  value = azurerm_cosmosdb_account.main.endpoint
}