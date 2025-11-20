data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "terraform-learning-478805" 
  family      = "ubuntu-2204-lts"
}

resource "google_compute_instance" "web" {
  name         = "web"
  machine_type = "e2-micro"

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = "default"
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

}
