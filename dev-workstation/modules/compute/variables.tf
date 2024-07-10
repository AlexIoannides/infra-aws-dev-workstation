variable "namespace" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable s3_bucket_name {
  type = string
  default = null
}

variable s3_bucket_iam_role {
  type = any
  default = null
}
