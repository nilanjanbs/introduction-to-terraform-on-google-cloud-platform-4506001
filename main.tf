resource "google_compute_network" "app" {
  name                    = var.netowrk_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "app" {
  name          = "app"
  ip_cidr_range = "10.2.0.0/16"
  region        =  var.region
  network       = google_compute_network.app.id
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
   subnetwork = var.sub_netowrk_name
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

}