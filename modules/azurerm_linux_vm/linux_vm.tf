resource "azurerm_network_interface" "nics" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
    resource_group_name = each.value.resource_group_name
  
  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
    size               = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [ azurerm_network_interface.nics[each.key].id]

disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}