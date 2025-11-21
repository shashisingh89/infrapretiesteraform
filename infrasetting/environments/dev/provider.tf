terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
 /* backend "azurerm" {
    resource_group_name  = "rg-shashi-dev-todoapp-01"
    storage_account_name = "infrastatestorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }*/
}

provider "azurerm" {
  features {}
  subscription_id = "12070104-5366-47e7-ae69-d5a2bd98c79e"
}