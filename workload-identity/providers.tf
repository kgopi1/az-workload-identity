terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
  }
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/kglab02/"
  personal_access_token = "<insert_pat>"
}

provider "azurerm" {
  features {
    
  }
}

provider "azuread" {
  
}