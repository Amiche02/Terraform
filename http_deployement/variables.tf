# variables.tf

# Nom du groupe de ressources existant
variable "resource_group_name" {
  description = "Nom du groupe de ressources dans lequel on va créer les ressources"
  type        = string
  default     = "junia-terraform-rg"
}

# Emplacement partagé pour les ressources
variable "location" {
  description = "Emplacement des ressources"
  type        = string
  default     = "North Europe"
}

# Nom du compte de stockage pour le blob
variable "storage_account_name" {
  description = "Nom du compte de stockage pour le blob"
  type        = string
  default     = "mystorageaccount"
}

# Nom de la base de données Cosmos DB
variable "cosmos_db_endpoint" {
  description = "Endpoint de la base de données Cosmos DB"
  type        = string
}

# Clé de Cosmos DB
variable "cosmos_db_key" {
  description = "Clé de Cosmos DB"
  type        = string
}

# Nom du plan de service App Service
variable "app_service_plan_name" {
  description = "Nom du plan de service"
  type        = string
  default     = "my-app-service-plan"
}

# Nom de l'App Service
variable "app_service_name" {
  description = "Nom de l'App Service"
  type        = string
  default     = "my-app-service"
}
