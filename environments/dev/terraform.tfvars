resource_groups = {
  "rg-dev-k8s-01" = {
    location = "centralindia"
    tags     = { environment = "dev", project = "landing-zone" }
  }
}

acrs = {
  "acrdevk8s01" = {
    resource_group_name = "rg-dev-k8s-01"
    location            = "centralindia"
    sku                 = "Basic"
  }
}

aks_clusters = {
  "aks-dev-k8s-01" = {
    resource_group_name = "rg-dev-k8s-01"
    location            = "centralindia"
    dns_prefix = "devaks"
    default_node_pool = {
      name       = "agentpool"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
  }
}
