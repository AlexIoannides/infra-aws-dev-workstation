resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "private_key" {
  filename        = pathexpand("~/.ssh/${var.namespace}-workstation")
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "ssh" {
  key_name   = "${var.namespace}-ssh-access-${random_integer.id.result}"
  public_key = tls_private_key.ssh_key.public_key_openssh
  tags = {
    Name    = "ssh-public-key"
    Project = var.namespace
  }
}
