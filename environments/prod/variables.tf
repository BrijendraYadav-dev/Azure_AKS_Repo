variable "resource_groups" {
  type = map(object({
    location = string
    tags     = optional(map(string), {})
  }))
  description = "Map of resource groups for prod"
}

variable "acrs" {
  type = map(object({
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    admin_enabled       = optional(bool, false)
    tags                = optional(map(string), {})
  }))
  description = "Map of ACRs for prod"
}

variable "aks_clusters" {
  type = map(object({
    resource_group_name = string
    location            = string
    kubernetes_version  = optional(string)
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
      tags       = optional(map(string), {})
    })
    identity_type = optional(string, "SystemAssigned")
    tags          = optional(map(string), {})
  }))
  description = "Map of AKS clusters for prod"
}
