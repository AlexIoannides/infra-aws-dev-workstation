terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }
  }
  backend "s3" {
    bucket  = "ioannides-dev-terraform"
    key     = "dev-workstation/prod/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

module "workstation" {
  source        = "../../modules/workstation"
  namespace     = var.namespace
  instance_type = var.instance_type
  ami           = var.ami
  bucket_name   = var.bucket_name
}
