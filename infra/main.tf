terraform {
     cloud {
    organization = "rghdrizzle"

    workspaces {
      name = "resume-api"
    }
  }
  
  required_providers{
    azurerm={
        source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm"{
    features { }
}

 resource "azurerm_resource_group" "resume-api" {
    name="resume-api"
    location = "centralindia"
  
}

resource "azurerm_storage_account" "resumestor" {
    name="reusmestorage"
    resource_group_name = azurerm_resource_group.resume-api.name
    location = azurerm_resource_group.resume-api.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}
resource "azurerm_storage_container" "resume" {
    name="resume"
    storage_account_name = azurerm_storage_account.resumestor.name
    container_access_type = "private"
  
}
resource "azurerm_app_service_plan" "appplan" {
    name="resumeplan"
    location = azurerm_resource_group.resume-api.location
    resource_group_name = azurerm_resource_group.resume-api.name
    kind="Linux"
    reserved = true
    
    sku{
        tier = "Dynamic"
        size = "Y1"
    }
}


resource "azurerm_function_app" "resumefa" {
    name="resume-app"
    location = azurerm_resource_group.resume-api.location
    resource_group_name = azurerm_resource_group.resume-api.name
    app_service_plan_id= azurerm_app_service_plan.appplan.id
    storage_account_name = azurerm_storage_account.resumestor.name
    storage_account_access_key = azurerm_storage_account.resumestor.primary_access_key
    os_type                    = "linux"
    version                    = "~4" 

    app_settings ={
        FUNCTION_WORKER_RUNTIME ="python"

    }
    site_config {
    linux_fx_version = "python|3.9"
  }

  
}





