# Resource Group
resource "azurerm_resource_group" "HVG-TERRAFORM-RM" {
    name     = "HVG-TERRAFORM-RM"
    location = "uksouth"
}

# Virtual Network
resource "azurerm_virtual_network" "HVG-TERRAFORM-VNET" {
  name                = "HVG-TERRAFORM-VNET"
  resource_group_name = azurerm_resource_group.HVG-TERRAFORM-RM.name
  location            = azurerm_resource_group.HVG-TERRAFORM-RM.location
  address_space       = ["10.0.0.0/16"]
}

# App Service Plan
resource "azurerm_app_service_plan" "HVG-TERRAFORM-SVC-PLAN" {
  name                = "HVG-TERRAFORM-SVC-PLAN"
  location            = azurerm_resource_group.HVG-TERRAFORM-RM.location
  resource_group_name = azurerm_resource_group.HVG-TERRAFORM-RM.name

  sku {
    tier = "Shared"
    size = "D1"
  }
}

# Web App
resource "azurerm_app_service" "HVG-TERRAFORM-APP-SVC" {
  name                = "${var.prefix}-appservice"
  location            = azurerm_resource_group.HVG-TERRAFORM-RM.location
  resource_group_name = azurerm_resource_group.HVG-TERRAFORM-RM.name
  app_service_plan_id = azurerm_app_service_plan.HVG-TERRAFORM-SVC-PLAN.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "GitHub"
    always_on                = "true"
  }

  app_settings = {
    "ENVORNMENT" = "TERRAFORMAPP"
  }
}

variable "prefix" {
    description = "Prefix for web app"
}