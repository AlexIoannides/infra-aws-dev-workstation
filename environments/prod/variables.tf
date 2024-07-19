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
  description = "AMI to use for instance (must be compatible with instance)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type to use for workstation (must be compatible with AMI)"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket for workstation data I/O"
  type        = string
  default     = null
}
