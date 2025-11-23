rgs = {
  rg1 = {
    name       = "rg-shashi-dev-todoapp-01"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}


storage_accounts = {
  stg1 = {
    name                             = "storageshashitodo003"
    location                         = "centralindia"
    resource_group_name              = "rg-shashi-dev-todoapp-01"
    account_tier                     = "Standard"
    account_replication_type         = "GRS"
    account_kind                     = "BlobStorage"
    access_tier                      = "Hot"
    
  }
}

venet = {
vnet1 = {
    name                = "vnet-shashi-dev-todoapp-01"
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  resource_group_name = "rg-shashi-dev-todoapp-01"

}
}


subnet={
subnet1={
    name                 = "frontend-subnet"
  resource_group_name  = "rg-shashi-dev-todoapp-01"
  virtual_network_name = "vnet-shashi-dev-todoapp-01"
  address_prefixes     = ["10.0.1.0/24"]
}
subnet2={
    name                 = "backend-subnet"
  resource_group_name  = "rg-shashi-dev-todoapp-01"
  virtual_network_name = "vnet-shashi-dev-todoapp-01"
  address_prefixes     = ["10.0.2.0/24"]
}
}

nic={
nic1={
    name                = "nic-shashi-dev-todoapp-01"
  location            = "centralindia"
  resource_group_name = "rg-shashi-dev-todoapp-01"
  ip_configuration = {
    ipconfig1={
      name                          = "shashi_ipconfig"
      subnet_id                     = "/subscriptions/12070104-5366-47e7-ae69-d5a2bd98c79e/resourceGroups/rg-shashi-dev-todoapp-01/providers/Microsoft.Network/virtualNetworks/vnet-shashi-dev-todoapp-01/subnets/frontend-subnet"
      private_ip_address_allocation  = "Dynamic"
    }
  }
}


nic2={
    name                = "nic-shashi-dev-todoapp-02"
  location            = "centralindia"
  resource_group_name = "rg-shashi-dev-todoapp-01"
  ip_configuration = {
    ipconfig1={
      name                          = "shashi_ipconfig"
      subnet_id                     = "/subscriptions/12070104-5366-47e7-ae69-d5a2bd98c79e/resourceGroups/rg-shashi-dev-todoapp-01/providers/Microsoft.Network/virtualNetworks/vnet-shashi-dev-todoapp-01/subnets/backend-subnet"
      private_ip_address_allocation  = "Dynamic"
    }
  }
}


}


vmlinux = {
  vnet1 = {
    nic_name    = "nic-shashi-dev-todoapp-05"
    vnet_name   = "vnet-shashi-dev-todoapp-01"
    pip_name    = "pip-shashi-dev-todoapp-01"
    size        = "Standard_F2"
    kv_name     = "kv-shashi-dev-todoapp-04"
    admin_username = "azureuser4"
    admin_password = "MySecure@1234567"
    name                = "vm-shashi-dev-todoapp-01"
    location            = "centralindia"
    rg_name = "rg-shashi-dev-todoapp-01"
    source_image_reference = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
  version   = "latest"
}
 tags = {
      environment = "dev"
    }
    subnet_name = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
     
    ]
  }
 
 vnet2 = {
    nic_name    = "nic-shashi-dev-todoapp-04"
    vnet_name   = "vnet-shashi-dev-todoapp-01"
    pip_name    = "pip-shashi-dev-todoapp-02"
    size        = "Standard_F2"
    kv_name     = "kv-shashi-dev-todoapp-04"
    admin_username = "azureuser4"
    admin_password = "MySecure@1234567"
    name                = "vm-shashi-dev-todoapp-02"
    location            = "centralindia"
    rg_name = "rg-shashi-dev-todoapp-01"
    source_image_reference = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
  version   = "latest"
}
 tags = {
      environment = "dev"
    }
    subnet_name = [
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
 


 
}

public_ips = {
  app1 = {
    name                = "pip-shashi-dev-todoapp-01"
    resource_group_name = "rg-shashi-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
  app2 = {
    name                = "pip-shashi-dev-todoapp-02"
    resource_group_name = "rg-shashi-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
}


key_vaults = {
  kv1 = {
    kv_name  = "kv-shashi-dev-todoapp-04"
    location = "centralindia"
    rg_name  = "rg-shashi-dev-todoapp-01"
  }
}