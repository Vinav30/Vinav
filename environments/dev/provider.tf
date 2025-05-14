terraform {
  required_providers {
    azurem={
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  } 
  backend "azurerm" {
    
  }

}
provider "azurem" {
  features {
    
  }
  subscription_id = "a4b25e75-be62-4cb6-bcb5-48e2492054ab"
}