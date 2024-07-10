variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "ami" {
  description = "AMI to use for instance - must be compatible with instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type to create"
  type        = string
}

variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  type        = string
  default     = null
}

variable "bucket_name" {
  description = "S3 bucket with read/write access that EC2 instance can use for data I/O"
  type        = string
  default     = null
}
