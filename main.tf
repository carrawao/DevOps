terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.0.0"
    }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg-dhbw-devops" {
  name = "rg-dhbw-devops"
  location = var.region
}

resource "azurerm_service_plan" "app-service-plan" {
  name  = "plan-dhbw"
  resource_group_name = azurerm_resource_group.rg-dhbw-devops.name
  location = azurerm_resource_group.rg-dhbw-devops.location
  sku_name = "F1"
  os_type = "Linux"
  }

resource "azurerm_linux_web_app" "app" {
    name = "app-dhbw-devops"
    resource_group_name = azurerm_resource_group.rg-dhbw-devops.name
    location = azurerm_resource_group.rg-dhbw-devops.location
    service_plan_id = azurerm_service_plan.app-service-plan.id

    site_config {
        always_on = false
        application_stack {
            docker_image = "carrawao/devops-devops"
            docker_image_tag = "latest"
        }
    }
}


