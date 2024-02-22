
# Resource group
resource "azurerm_resource_group" "rg-id-prd-001" {
  provider = azurerm.identity
  name     = var.rg_id
  location = var.location
}
resource "azurerm_resource_group" "rg-con-prd-001" {
  provider = azurerm.connectivity
  name     = var.rg_con
  location = var.location
}
resource "azurerm_resource_group" "rg-man-prd-001" {
provider = azurerm.management
  name     = var.rg_man
  location = var.location
}
resource "azurerm_resource_group" "rg-wrk-prd-001" {
    provider = azurerm.workload
  name     = var.rg_wrk
  location = var.location
}
