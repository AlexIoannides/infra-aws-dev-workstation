resource "aws_security_group" "allow_ssh" {
  name        = "${var.namespace}-allow-ssh-${random_integer.id.result}"
  description = "Allow SSH ingress from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ssh-ingress"
    Project = var.namespace
  }
}

resource "aws_security_group" "allow_all_outboud" {
  name        = "${var.namespace}-allow-all-outboud-${random_integer.id.result}"
  description = "Allow all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ssh-egress"
    Project = var.namespace
  }
}
