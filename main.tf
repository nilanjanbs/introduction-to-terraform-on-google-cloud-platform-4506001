module "app_network" {
  source  = "terraform-google-modules/network/google"
  version = "13.0.0"
  # insert the 3 required variables here
  network_name = "${var.netowrk_name}-network"
  project_id  = var.project_id
  subnets = [
        {
            subnet_name           = "${var.netowrk_name}-sub0"
            subnet_ip             = var.ip_range
            subnet_region         = var.region
        }
    ]
  ingress_rules = [
   {
    name                    = "${var.netowrk_name}-ingress"
    description             = "Ingress_rule"
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = ["${var.netowrk_name}-ingress"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["80","8080"]
      }
    ]
   }
  ]

}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = var.image-project
  family      = var.image-family
}

resource "google_compute_instance" "web" {
  name         = "web"
  machine_type = var.machine-type

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
    subnetwork = module.app_network.subnets_names[0]
    access_config {
      # Leave empty for dynamic public IP
    }
  }

  metadata_startup_script = "apt update;apt install nginx; echo ${var.project_id} > /var/www/html/index.html"
  allow_stopping_for_update = true

}
