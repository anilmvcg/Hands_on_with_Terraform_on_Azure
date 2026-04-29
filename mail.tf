terraform {
  required_providers {
    azurerm = {
      source  = "HashiCorp/azurerm"
      version = ">=3.43.0"
    }
  }
  required_version = "~> 1.14"

  cloud {

    organization = "anilkrmv"

    workspaces {
      name = "Hands_on_with_Terraform_on_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  resource_provider_registrations = "all"
}
resource "azurerm_resource_group" "rg" {
  name     = "813-fa75392d-hands-on-with-terraform-on-azure"
  location = "South Central US"
}
module "securestorage" {
  source               = "app.terraform.io/anilkrmv/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg
  storage_account_name = "jkhfkshjkshdfsS"
}