output "dns_record_fqdn" {
  description = "Fully qualified DNS name for the record"
  value       = "${var.record_name}.${var.dns_zone_name}"
}

output "dns_record_ip" {
  description = "IP address mapped to the DNS record"
  value       = data.kubernetes_service.ingress.status[0].load_balancer[0].ingress[0].ip
}
