data "azurerm_resource_group" "vnet" {
  name = var.virtual_network_resource_group_name
}

data "azurerm_virtual_network" "subscription_vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.vnet.name
}

data "azuread_client_config" "current" {}

module "naming_network" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
  prefix  = ["bn-${var.team_abbreviation}", "network", local.location_abbreviation]
  suffix  = [var.environment]
}

resource "azurerm_resource_group" "network" {
  name     = module.naming_network.resource_group.name
  location = var.location
}

