provider "aws" {
  region = var.region
}

provider "cloudinit" {}

provider "tls" {}

provider "local" {}

provider "random" {}
