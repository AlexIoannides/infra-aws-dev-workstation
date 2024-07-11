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
