output "workstation_public_ip" {
  description = "IP address to use when conncection to workstation via SSH"
  value       = module.workstation.public_ip
}

output "ssh_cmd" {
  description = "SSH command to use for connecting to the workstation"
  value       = "ssh -i ${module.workstation.private_key_path} ec2-user@${module.workstation.public_ip}"
}
