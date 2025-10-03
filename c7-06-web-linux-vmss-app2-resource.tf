# Resource: Azure Linux Virtual Machine Scale Set - App2
resource "azurerm_linux_virtual_machine_scale_set" "app2_web_vmss" {
  name                = "${local.resource_name_prefix}-app2-web-vmss"
  #computer_name_prefix = "vmss-App2" # if name argument is not valid one for VMs, we can use this for VM Names
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard_D2s_v3"
  instances           = 1
  admin_username      = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  source_image_reference {
   publisher = "canonical"
   offer = "ubuntu-24_04-lts"
   sku       = "server"
   version = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  upgrade_mode = "Automatic"
  
  network_interface {
    name    = "app2-web-vmss-nic"
    primary = true
    network_security_group_id = azurerm_network_security_group.app2_web_vmss_nsg.id
    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.websubnet.id  
      #load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
      application_gateway_backend_address_pool_ids = [
        for pool in azurerm_application_gateway.web_ag.backend_address_pool : pool.id if pool.name == local.backend_address_pool_name_app2]            
    }
  }
}
  

