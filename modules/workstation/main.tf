data "aws_s3_bucket" "data_storage" {
  bucket = var.bucket_name
}

resource "aws_instance" "workstation" {
  ami                         = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_role.bucket_access_role
  instance_type               = var.instance_type
  # key_name = TODO
  security_groups = [
    aws_security_group.allow_ssh.name,
    aws_security_group.allow_all_outboud.name
  ]
  tags = {
    Name : var.namespace
  }
  # user_data = TODO
}
