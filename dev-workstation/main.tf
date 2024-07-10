module "storage" {
  source      = "./modules/storage"
  namespace   = var.namespace
  bucket_name = var.bucket_name
}

module "compute" {
  source             = "./modules/compute"
  namespace          = var.namespace
  instance_type      = var.instance_type
  ami                = var.ami
  s3_bucket_name     = var.bucket_name
  s3_bucket_iam_role = module.storage.bucket_iam_access_role
}
