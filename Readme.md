# Terraform Azure Project - Blob Storage & HTTP Deployment

This repository contains two Terraform configurations for provisioning an Azure Blob Storage with Cosmos DB and deploying an HTTP application using Azure App Service. The configurations are divided into two folders:

1. `blob_storage_Nosql_TP1`: Provisioning of Blob Storage and Cosmos DB.
2. `http_deployement`: Deployment of an HTTP App Service connected to the Blob Storage and Cosmos DB.

---

## Requirements

- **Terraform**: Ensure you have Terraform installed on your system. You can download it from [here](https://www.terraform.io/downloads.html).
- **Azure CLI**: Install Azure CLI from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) to authenticate with Azure.

---

## Step 1: Provisioning Blob Storage & Cosmos DB

1. **Navigate to the `blob_storage_Nosql_TP1` directory**:

   ```bash
   cd blob_storage_Nosql_TP1
   ```

2. **Initialize Terraform**:

   Run the following command to initialize the Terraform project. This will download all required providers and set up the environment.

   ```bash
   terraform init
   ```

3. **Review the Terraform Plan**:

   You can preview the infrastructure changes Terraform will make by running:

   ```bash
   terraform plan
   ```

4. **Apply the Terraform Plan**:

   Deploy the infrastructure to Azure by running the following command. Review the changes and type `yes` when prompted to confirm.

   ```bash
   terraform apply
   ```

   Once completed, Terraform will display the outputs, including the Cosmos DB endpoint, primary key, and storage account name.

5. **Save the Output Variables**:

   After the resources are provisioned, you need to copy the output values (Cosmos DB endpoint, primary key, and storage account name). These will be required for the HTTP deployment in the next step.

---

## Step 2: Deploy HTTP App Service

The second part of this project deploys an HTTP application using Azure App Service. This application is connected to the Blob Storage and Cosmos DB created in Step 1.

### 1. Navigate to the `http_deployement` Directory:

```bash
cd ../http_deployement
```

### 2. Import the Existing Resource Group:

Since the resource group was already created in the previous step, we need to import it into the Terraform state for this module. This is done by running the following command:

```bash
terraform import azurerm_resource_group.main /subscriptions/<your-subscription-id>/resourceGroups/junia-terraform-rg
```

### 3. Update `terraform.tfvars`:

In this directory, you will find the `terraform.tfvars` file. You need to update this file with the values you copied from Step 1 (Cosmos DB endpoint, primary key, and storage account name).

Example:

```plaintext
cosmos_db_endpoint = "https://my-cosmos-db.documents.azure.com:443/"
cosmos_db_key = "your-primary-key-here"
storage_account_name = "mystorageaccount"
```

### 4. Initialize Terraform:

Run the following command to initialize the Terraform project in the `http_deployement` directory.

```bash
terraform init
```

### 5. Review the Terraform Plan:

Before deploying the App Service, review the changes that will be made:

```bash
terraform plan
```

### 6. Apply the Terraform Plan:

To deploy the HTTP App Service connected to the Blob Storage and Cosmos DB, run the following command:

```bash
terraform apply
```

After confirming, Terraform will deploy the necessary resources. The App Service will be connected to the Cosmos DB and Blob Storage using the settings you provided.

---

## Variables

Both `blob_storage_Nosql_TP1` and `http_deployement` use variables to configure the deployment. Below is a list of variables used in the project.

### `blob_storage_Nosql_TP1/variables.tf`

- `location`: The Azure region where the resources will be deployed. Default: `North Europe`.
- `resource_group_name`: The name of the Azure resource group.
- `storage_account_name`: The name of the storage account.
- `cosmos_db_name`: The name of the Cosmos DB instance.

### `http_deployement/variables.tf`

- `app_service_plan_name`: The name of the App Service plan.
- `app_service_name`: The name of the App Service.
- `cosmos_db_endpoint`: The endpoint of the Cosmos DB.
- `cosmos_db_key`: The primary key of the Cosmos DB.
- `storage_account_name`: The name of the storage account.
- `location`: The Azure region for deployment. Default: `North Europe`.
- `resource_group_name`: The name of the resource group.

---

## Cleanup

To destroy the resources provisioned by Terraform, run the following command in both `blob_storage_Nosql_TP1` and `http_deployement` directories:

```bash
terraform destroy
```

This will remove all resources created by Terraform in this project.

---
