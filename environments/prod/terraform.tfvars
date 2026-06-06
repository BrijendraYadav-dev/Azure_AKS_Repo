resource_groups = {
  "rg-prod-k8s-01" = {
    location = "West US"
    tags     = { environment = "prod", project = "landing-zone" }
  }
}

acrs = {
  "acrprodk8s01" = {
    resource_group_name = "rg-prod-k8s-01"
    location            = "West US"
    sku                 = "Premium"
  }
}

aks_clusters = {
  "aks-prod-k8s-01" = {
    resource_group_name = "rg-prod-k8s-01"
    location            = "West US"
    dns_prefix          = "aksprod01"
    default_node_pool = {
      name       = "agentpool"
      node_count = 3
      vm_size    = "Standard_DS3_v2"
    }
  }
}
