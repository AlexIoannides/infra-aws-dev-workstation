variable "namespace" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "path_to_ssh_public_key" {
  type      = string
  sensitive = true
}

variable "path_to_ssh_private_key" {
  type      = string
  sensitive = true
}
