data "aws_s3_bucket" "data_storage" {
  bucket = var.bucket_name
}

data "cloudinit_config" "config" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content      = "${path.module}/cloud_config.yaml"
  }
}

resource "aws_instance" "workstation" {
  ami                         = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.bucket_access.name
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh_key.key_name
  security_groups = [
    aws_security_group.allow_ssh.name,
    aws_security_group.allow_all_outboud.name
  ]
  tags = {
    Name : var.namespace
  }
  user_data = data.cloudinit_config.config.rendered
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "${var.namespace}-ssh-access"
  public_key = file(var.path_to_ssh_public_key)
  tags = {
    Name : var.namespace
  }
}
