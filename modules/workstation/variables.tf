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
  type    = string
  default = null
}
