output "public_ip" {
  description = "Public IP address of workstation (EC2 instance)"
  value = aws_instance.workstation.public_ip
}

output "private_key_path" {
  description = "Private key file to use for SSH access"
  value = local_sensitive_file.private_key.filename
}
