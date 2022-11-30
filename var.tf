variable "rg_name" {
  type    = string
  default = "module-rg"
}
variable "location" {
  type    = string
  default = "East US"
}
variable "nsg_name" {
  type    = list(string)
  default = ["nsg-1", "nsg-2"]
}
variable "nsg_rule" {
  type = list(object(
    {
    
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }
  ))
  default = [{
    
    name                       = "test123"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

    },
    {
      name                       = "test4"
      priority                   = 101
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
}
