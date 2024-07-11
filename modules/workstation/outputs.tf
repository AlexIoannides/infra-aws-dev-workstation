output "public_ip" {
  value = aws_instance.workstation.public_ip
}

output "ssh_cmd" {
  value = "ssh -i ${var.path_to_ssh_private_key} ec2-user@${aws_instance.workstation.public_ip}"
}
