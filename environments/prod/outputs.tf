output "workstation_public_ip" {
  value = module.workstation.public_ip
}

output "ssh_cmd" {
  value = "ssh -i ${var.path_to_ssh_private_key} ec2-user@${module.workstation.public_ip}"
}
