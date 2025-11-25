
variable "project_id" {
  type    = string
  default = "terraform-learning-478805"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "sub_netowrk_name" {
  type    = string
  default = "app"
}

variable "image-project" {
  type    = string
  default = "ubuntu-os-cloud"
}

variable "image-family" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "machine-type" {
  type    = string
  default = "e2-micro"
}
