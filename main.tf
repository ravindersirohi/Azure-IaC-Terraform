# Resource Group
resource "azurerm_resource_group" "HVG-TERRAFORM-RM" {
    name     = "HVG-TERRAFORM-RM"
    location = "uksouth"
}

resource "azurerm_virtual_network" "HVG-TERRAFORM-VNET" {
  name                = "HVG-TERRAFORM-VNET"
  resource_group_name = azurerm_resource_group.HVG-TERRAFORM-RM.name
  location            = azurerm_resource_group.HVG-TERRAFORM-RM.location
  address_space       = ["10.0.0.0/16"]
}