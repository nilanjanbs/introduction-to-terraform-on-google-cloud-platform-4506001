variable "netowrk_name" {
  type    = string
  default = "app"
}

variable "project_id" {
  type    = string
}

variable "sub_netowrk_name" {
  type    = string
}

variable "ip_range" {
  type    = string
  default = "10.10.20.0/24"
}

variable "region" {
  type    = string
  default = "us-west1"
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
