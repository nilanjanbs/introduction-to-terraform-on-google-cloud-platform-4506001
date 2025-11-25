module "qa" {
  source = "./modules/blog"
  project_id = var.project_id
  netowrk_name = "qa"
  ip_range = "10.10.20.0/24"
  sub_netowrk_name = var.sub_netowrk_name
}