# Development Workstations on AWS

This repository contains a Terraform module that will create an AWS EC2 instance in the `default` VPC, with a User-specified instance type and AMI. It will be configured so that:

- it can be accessed via SSH using a new key created on the User's machine; and,
- the instance has read-write access to an S3 bucket specified by the User.
