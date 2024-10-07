from flask import jsonify, request
import os
from azure.cosmos import CosmosClient
from azure.storage.blob import BlobServiceClient

def configure_routes(app):
    @app.route('/')
    def home():
        return jsonify({"message": "Hello from Flask API!"})

    @app.route('/cosmos-db', methods=['GET'])
    def get_cosmos_data():
        # Connexion à Cosmos DB
        cosmos_db_endpoint = os.getenv("COSMOS_DB_ENDPOINT")
        cosmos_db_key = os.getenv("COSMOS_DB_KEY")
        client = CosmosClient(cosmos_db_endpoint, cosmos_db_key)

        # Example: Récupérer les bases de données
        databases = client.list_databases()
        return jsonify({"databases": databases})

    @app.route('/blob-storage', methods=['POST'])
    def upload_to_blob():
        # Connexion à Blob Storage
        storage_account_name = os.getenv("STORAGE_ACCOUNT")
        blob_service_client = BlobServiceClient(
            account_url=f"https://{storage_account_name}.blob.core.windows.net/",
            credential=os.getenv("COSMOS_DB_KEY")
        )

        # Exemple d'upload de fichier
        container_name = 'mycontainer'
        blob_client = blob_service_client.get_blob_client(container=container_name, blob="example.txt")
        
        blob_client.upload_blob("Hello, this is a test file!")
        return jsonify({"message": "File uploaded to blob storage!"})
