resource "azurerm_resource_group" "environment_rg" {
  name     = "k8s-rg"
  location = var.resource_group_location
}
