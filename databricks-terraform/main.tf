terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {
  azure_workspace_resource_id = "/subscriptions/2cf32eaa-ed55-49d0-a43c-38993f81b413/resourceGroups/first_resource_group/providers/Microsoft.Databricks/workspaces/demo1"
  azure_client_id             = var.client_id
  azure_client_secret         = var.client_secret
  azure_tenant_id             = var.tenant_id
}

resource "databricks_notebook" "example" {
  path           = "/Shared/demo-notebook"
  language       = "PYTHON"
  content_base64 = base64encode(file("demo.py"))
}
