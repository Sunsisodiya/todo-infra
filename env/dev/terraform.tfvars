rgs = {
  rg1 = {
    name       = "rg-dev-01"
    location   = "Central India"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-dev-todoapp-01"
    location            = "Central India"
    resource_group_name = "rg-dev-01"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "snet-frontend-dev-01"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "snet-backend-dev-01"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  pip1 = {
    name                = "pip-dev-todoapp-01"
    location            = "Central India"
    resource_group_name = "rg-dev-01"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
    }
  }

  pip2 = {
    name                = "pip-dev-todoapp-02"
    location            = "Central India"
    resource_group_name = "rg-dev-01"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
    }
  }
}

key_vaults = {
  kv1 = {
    kv_name  = "meradevkv"
    location = "Central India"
    rg_name  = "rg-dev-01"
  }
}

vms = {
  vm1 = {
    nic_name    = "nic-frontend-dev-01"
    location    = "Central India"
    rg_name     = "rg-dev-01"
    vnet_name   = "vnet-dev-todoapp-01"
    subnet_name = "snet-frontend-dev-01"
    pip_name    = "pip-dev-todoapp-01"
    vm_name     = "vm-frontend-dev-01"
    size        = "Standard_F2"
    kv_name = "meradevkv"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    nic_name    = "nic-backend-dev-01"
    location    = "Central India"
    rg_name     = "rg-dev-01"
    vnet_name   = "vnet-dev-todoapp-01"
    subnet_name = "snet-backend-dev-01"
    pip_name    = "pip-dev-todoapp-02"
    vm_name     = "vm-backend-dev-01"
    size        = "Standard_F2"
    kv_name = "meradevkv"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

sql_servers = {
  sql1 = {
    name     = "sql-dev-todoapp-786"
    location = "West Europ"
    rg_name  = "rg-dev-01"
    admin    = "sqladminuser"
    password = "Password@123"
  }
}

sql_databases = {
  db1 = {
    name         = "sqldb-dev-01"
    server_key   = "sql1"
    sku_name     = "S0"
    license_type = "LicenseIncluded"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    enclave_type = "VBS"
    max_size_gb  = 2

    tags = {
      env = "dev"
    }
  }
}
