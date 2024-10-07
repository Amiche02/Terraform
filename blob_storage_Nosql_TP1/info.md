### 1. **Define Outputs for the Keys in the Terraform Files**

In your `outputs.tf`, add the following:

```hcl
output "primary_key" {
  value     = azurerm_cosmosdb_account.main.primary_key
  sensitive = true
}

output "secondary_key" {
  value     = azurerm_cosmosdb_account.main.secondary_key
  sensitive = true
}
```

### 2. **Run `terraform apply`**

After applying the plan with `terraform apply`, Terraform will store these outputs in its state.

### 3. **View the Output Values**

Once you've applied the Terraform plan, you can run the following commands to view the sensitive outputs:

- To get the primary key:

```bash
terraform output primary_key
```

- To get the secondary key:

```bash
terraform output secondary_key
```

### Viewing Non-Sensitive Outputs

For non-sensitive outputs like the `cosmos_db_endpoint` and `storage_account_name`, you can add them to the `outputs.tf` as well if they aren't already, for example:

```hcl
output "cosmos_db_endpoint" {
  value = azurerm_cosmosdb_account.main.endpoint
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}
```

Run `terraform output` to see all the outputs together:

```bash
terraform output
```
