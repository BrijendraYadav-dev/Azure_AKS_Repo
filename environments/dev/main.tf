module "resource_groups" {
  source   = "../../modules/resource_group"
  for_each = var.resource_groups

  name     = each.key
  location = each.value.location
  tags     = each.value.tags
}

module "acrs" {
  source   = "../../modules/acr"
  for_each = var.acrs

  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  tags                = each.value.tags

  depends_on = [module.resource_groups]
}

module "aks" {
  source   = "../../modules/aks"
  for_each = var.aks_clusters

  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  kubernetes_version  = each.value.kubernetes_version
  dns_prefix = each.value.dns_prefix
  default_node_pool   = each.value.default_node_pool
  identity_type       = each.value.identity_type
  tags                = each.value.tags

  depends_on = [module.resource_groups]
}
