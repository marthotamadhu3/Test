variable "dns_zone_name" {
  description = "Private DNS zone name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group of Private DNS zone"
  type        = string
}

variable "record_name" {
  description = "DNS record name (subdomain)"
  type        = string
}

variable "k8s_namespace" {
  description = "Namespace where ingress service is deployed"
  type        = string
}

variable "k8s_service_name" {
  description = "Ingress service name"
  type        = string
}
