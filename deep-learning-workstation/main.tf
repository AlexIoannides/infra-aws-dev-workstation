provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "deep-learning-workstation" {
  ami = "ami-0a6d88003a7f81c18 "
  instance_type = "p3.2xlarge"
  tags = {
    Name = "pytorch-dev"
  }
}
