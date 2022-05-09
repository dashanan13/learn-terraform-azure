terraform {
  required_version = ">=1.1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.93.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraformRG"
    storage_account_name = "terrastate13"
    container_name       = "remotestate"
    subscription_id      = "058f5639-3033-4b94-8a57-a06abd997a9d"
    key                  = "tfstateremote.tfstate"
  }
}

provider "random" {
  # Configuration options
}

provider "local" {
  # Configuration options
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id = var.subscription_id
  #skip_provider_registration = true
}

module "basic" {
  source      = "./modules/basic"
  location    = var.location
  tags        = var.tags
}

module "function" {
  source      = "./modules/function"
  location    = var.location
}

module "local" {
  source      = "./modules/local"
  location    = var.location
}

module "variables" {
  source      = "./modules/variable"
  location    = var.location
}
