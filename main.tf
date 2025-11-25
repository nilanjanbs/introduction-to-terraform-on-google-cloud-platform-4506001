module "qa" {
  source = "./modules/blog"
  netowrk_name = "qa"
  project_id = "qa-project"
  ip_range = "10.10.20.0/16"
  sub_netowrk_name = "app"
}