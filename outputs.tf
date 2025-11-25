output "public_ip" {
  value = google_compute_instance.web.network_interface[0].access_config.0.nat_ip
}

output "subnet_ip" {
  value = module.app_network.subnets_ips[0]
}
output "subnet_name" {
  value = module.app_network.subnets_names[0]
}

output "network_name" {
  value = module.app_network.network_name
}