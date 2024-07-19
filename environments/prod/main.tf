module "workstation" {
  source        = "../../modules/workstation"
  namespace     = var.namespace
  instance_type = var.instance_type
  ami           = var.ami
  bucket_name   = var.bucket_name
}
