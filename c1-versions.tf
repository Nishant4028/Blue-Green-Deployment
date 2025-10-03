# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.0"
    }    
  }
}

# Provider Block
provider "azurerm" {
 subscription_id = "ab86ad4a-83cb-4d45-ba64-21eb6e8b12ea"
 features {}   
}



