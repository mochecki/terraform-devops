resource "azurerm_resource_group" "this" {
  name     = "rg-${var.prefix}-resources"
  location = var.location
}
