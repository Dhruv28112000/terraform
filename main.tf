terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id = "f724e338-e3f9-4799-b561-afb0c8d99728"
  client_id       = "128f4464-4748-4f4f-b7a3-513d6f938240"
  client_secret   = "~yN8Q~Qkbl4ChGC5Z9nIMcbkDEtHWVWbKzTZ~bi5"
  tenant_id       = "fb74c11b-dc74-4e33-a372-4b2fd6e583ec"
}

resource "azurerm_resource_group" "tfrg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  count               = length(var.nsg_name)
  name                = var.nsg_name[count.index]
  resource_group_name = var.rg_name
  location            = var.location
}
resource "azurerm_network_security_rule" "nsg_rule" {
  count                       = length(var.nsg_rule)
  name                        = var.nsg_rule[count.index].name
  priority                    = var.nsg_rule[count.index].priority
  direction                   = var.nsg_rule[count.index].direction
  access                      = var.nsg_rule[count.index].access
  protocol                    = var.nsg_rule[count.index].protocol
  source_port_range           = var.nsg_rule[count.index].source_port_range
  destination_port_range      = var.nsg_rule[count.index].destination_port_range
  source_address_prefix       = var.nsg_rule[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rule[count.index].destination_address_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = var.nsg_name[count.index]
}

