resource "aws_security_group" "allow_ssh" {
  name        = "${var.namespace}-allow-ssh"
  description = "Allow SSH ingress from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.namespace
  }
}

resource "aws_security_group" "allow_all_outboud" {
  name        = "${var.namespace}-allow-all-outboud"
  description = "Allow all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.namespace
  }
}

resource "aws_instance" "workstation" {
  ami = var.ami
  associate_public_ip_address = true
  # iam_instance_profile = TODO
  instance_type = var.instance_type
  # key_name = TODO
  security_groups = [
    aws_security_group.allow_ssh.name,
    aws_security_group.allow_all_outboud.name
  ]
  tags = {
    Name: var.namespace
  }
  # user_data = TODO
}
