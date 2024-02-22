resource "azurerm_network_interface" "nic-id-dc-prd-euw-001" {
  provider = azurerm.identity
  name                = "nic-id-dc-prd-euw-001"
  location            = azurerm_resource_group.rg-id-prd-001.location
  resource_group_name = azurerm_resource_group.rg-id-prd-001.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet-id-dc-euw-001.id
    private_ip_address_allocation = "Static"
    private_ip_address = var.vm_dc_ipaddress
  }
}

resource "azurerm_windows_virtual_machine" "vmiddcprdeuw001" {
  provider = azurerm.identity
  name                = "vmiddcprdeuw001"
  computer_name       = "vmiddcprdeuw001"
  resource_group_name = azurerm_resource_group.rg-id-prd-001.name
  location            = azurerm_resource_group.rg-id-prd-001.location
  zone = 1
  license_type = var.vm_license_type
  size                = var.vm_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_password
  patch_assessment_mode = "AutomaticByPlatform"
  patch_mode          = "AutomaticByPlatform"
  network_interface_ids = [
    azurerm_network_interface.nic-id-dc-prd-euw-001.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "nic-wrk-dev-prd-euw-001" {
  provider = azurerm.workload
  name                = "nic-wrk-dev-prd-euw-001"
  location            = azurerm_resource_group.rg-wrk-prd-001.location
  resource_group_name = azurerm_resource_group.rg-wrk-prd-001.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet-wrk-shared-euw-001.id
    private_ip_address_allocation = "Dynamic"
 }
}

resource "azurerm_windows_virtual_machine" "vmwrkdevprdev" {
  provider = azurerm.workload
  name                = "vmwrkdevprdev"
  resource_group_name = azurerm_resource_group.rg-wrk-prd-001.name
  location            = azurerm_resource_group.rg-wrk-prd-001.location
  zone = 1
  license_type = var.vm_license_type 
  size                = var.vm_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_password
  patch_assessment_mode = "AutomaticByPlatform"
  patch_mode          = "AutomaticByPlatform"
  network_interface_ids = [
    azurerm_network_interface.nic-wrk-dev-prd-euw-001.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}