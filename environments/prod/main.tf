terraform {
  required_version = ">= 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.4"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
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

provider "cloudinit" {}

provider "tls" {}

provider "local" {}

provider "random" {}

module "workstation" {
  source        = "../../modules/workstation"
  namespace     = var.namespace
  instance_type = var.instance_type
  ami           = var.ami
  bucket_name   = var.bucket_name
}
