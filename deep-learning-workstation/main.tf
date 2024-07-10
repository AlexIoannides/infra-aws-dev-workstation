module "compute" {
  source = "./modules/compute" 
  namespace = var.namespace 
}

module "storage" {
  source = "./modules/database" 
  namespace = var.namespace 
}
