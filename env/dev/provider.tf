terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "hehehe-rg"
    storage_account_name = "tvsstg01"
    container_name       = "mycontainer"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3d1ce785-6c4d-4565-bb5e-3b46939260a6"
}
