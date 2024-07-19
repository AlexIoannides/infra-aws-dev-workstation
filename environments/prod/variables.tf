# Default values are to enable CI tests
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
  default     = "dev-workstation"
}

variable "ami" {
  description = "AMI to use for instance (must be compatible with instance)"
  type        = string
  default     = "ami-0a6d88003a7f81c18"
}

variable "instance_type" {
  description = "EC2 instance type to use for workstation (must be compatible with AMI)"
  type        = string
  default     = "p3.2xlarge"
}

variable "bucket_name" {
  description = "S3 bucket for workstation data I/O"
  type        = string
  default     = "ioannides-dev-data"
}
