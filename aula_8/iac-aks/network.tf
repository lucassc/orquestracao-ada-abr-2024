resource "azurerm_virtual_network" "virtual_network" {
  name                = "vnet"
  location            = azurerm_resource_group.environment_rg.location
  resource_group_name = azurerm_resource_group.environment_rg.name
  address_space       = ["${var.virtual_network}"]
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet"
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  resource_group_name  = azurerm_resource_group.environment_rg.name
  address_prefixes     = ["${var.subnet_network}"]
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = "net-security-group"
  location            = azurerm_resource_group.environment_rg.location
  resource_group_name = azurerm_resource_group.environment_rg.name

  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}
