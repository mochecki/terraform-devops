resource "azurerm_resource_group" "shared_rg" {
  name     = "rg-${var.prefix}-services-${var.environment}-001"
  location = var.location
}

##TEST

resource "azurerm_resource_group" "shared_rg" {
  
}