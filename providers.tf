provider "azurerm" {
  tenant_id = var.tenant_id
features {

  resource_group {
       prevent_deletion_if_contains_resources = false
     }
}
}
# Identity: subscription
provider "azurerm" {
  
  subscription_id = var.subid_id
  tenant_id = var.tenant_id
  alias           = "identity"
  features {
      resource_group {
       prevent_deletion_if_contains_resources = false
     }
}
}
# Connectivity subscription
provider "azurerm" {
  
  subscription_id = var.subid_con
  alias           = "connectivity"
  tenant_id = var.tenant_id
  features {  
    resource_group {
       prevent_deletion_if_contains_resources = false
     }
     }
}

# Management Subscription
provider "azurerm" {
  
  subscription_id = var.subid_man
  alias           = "management"
  tenant_id = var.tenant_id
  features {
      resource_group {
       prevent_deletion_if_contains_resources = false
     }
  }
}
# Workload Subscription
provider "azurerm" {
  
  subscription_id = var.subid_wrk
  alias           = "workload"
  tenant_id = var.tenant_id
  features {
      resource_group {
       prevent_deletion_if_contains_resources = false
     }
  }
}
