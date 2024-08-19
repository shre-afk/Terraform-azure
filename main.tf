terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "trial-services-eastus-rg"
  location = "eastus"

  tags = {
    Environment = "Dev"
    Purpose = "learning"
    DeployedBy ="Shre"
  }
}

resource "azurerm_key_vault" "kv" {
    name = "trial-appstore-dev-kv"
    location = "eastus"
    resource_group_name = "trial-services-eastus-rg"
    sku_name = "standard"
    tenant_id = "63c70cdf-c355-461c-a4f4-b0d8f939fe0b"
    tags = {
        Environment = "Dev"
        DeployedBy = "Shre"
    }
}