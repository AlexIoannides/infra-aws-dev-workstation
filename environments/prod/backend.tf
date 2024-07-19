terraform {
  backend "s3" {
    bucket  = "ioannides-dev-terraform"
    key     = "dev-workstation/prod/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}
