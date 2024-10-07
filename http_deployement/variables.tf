variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "junia-terraform-rg"
}

variable "location" {
  description = "Région de déploiement"
  type        = string
  default     = "North Europe"
}

variable "app_service_plan_name" {
  description = "Nom du plan App Service"
  type        = string
  default     = "app-service-plan"
}

variable "app_service_name" {
  description = "Nom de l'App Service"
  type        = string
  default     = "my-python-api"
}

variable "cosmos_db_endpoint" {
  description = "Point d’accès de la base de données Cosmos DB"
  type        = string
}

variable "cosmos_db_key" {
  description = "Clé d'accès à Cosmos DB"
  type        = string
}

variable "storage_account_name" {
  description = "Nom du compte de stockage"
  type        = string
}
