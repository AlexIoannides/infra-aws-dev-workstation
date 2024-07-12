terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57"
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
  source                  = "../../modules/workstation"
  namespace               = var.namespace
  instance_type           = var.instance_type
  ami                     = var.ami
  path_to_ssh_public_key  = var.path_to_ssh_public_key
  path_to_ssh_private_key = var.path_to_ssh_private_key
  bucket_name             = var.bucket_name
}
