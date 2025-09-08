provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

data "kubernetes_service" "ingress" {
  metadata {
    name      = var.k8s_service_name
    namespace = var.k8s_namespace
  }
}

resource "azurerm_private_dns_a_record" "dns_record" {
  name                = var.record_name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [
    data.kubernetes_service.ingress.status[0].load_balancer[0].ingress[0].ip
  ]
}
