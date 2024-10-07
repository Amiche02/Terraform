variable "resource_group_name" {
  description = "Nom du groupe de ressources dans lequel on va créer les ressources"
  type        = string
  default     = "junia-terraform-rg"
}

variable "location" {
  description = "Région Azure où déployer les ressources"
  type        = string
  default     = "North Europe"
}

variable "cosmos_db_name" {
  description = "Nom de la base de données Cosmos DB"
  type        = string
  default     = "my-cosmos-db"
}

variable "storage_account_name" {
  description = "Nom du compte de stockage pour le blob"
  type        = string
  default     = "mystorageaccount"
}