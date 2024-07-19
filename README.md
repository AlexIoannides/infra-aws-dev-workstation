# Development Workstations on AWS

This repository contains a Terraform module that can create an AWS EC2 instance in your `default` VPC, with a User-specified instance type and AMI. It will also be configured so that:

- It can be accessed via SSH using a new key created on the User's machine.
- The instance has read/write access to an S3 bucket specified by the User.

## Deep Learning with GPUs

If you configure an instance that has GPUs together with an AMI that can support their use, then you will have yourself a deep learning workstation. For example,

```terraform
ami           = "ami-0a6d88003a7f81c18"
instance_type = "p3.2xlarge"
```

Will give you an EC2 instance that has an NVIDIA Tesla V100 GPU using an image that is preconfigured with CUDA drivers and full PyTorch support.

## User Guide

Work through the following steps to get your workstation up-and-running.

### Prerequisites

Make sure you have [Terraform installed](https://developer.hashicorp.com/terraform/install), together with the [AWS CLI](https://aws.amazon.com/cli/) configured with credentials that enable CRUD operations for all major AWS services (e.g., EC2, S3, IAM). This deployment has also been configured to use an S3 bucket as a backend for storing the state of the deployment. See [environments/prod/backend.tf] for the full details and make sure that you have something similar available and configured (or delete this file to fall-back to storing state within a local file in this directory).

### Configure the Deployment

Create a `terraform.tfvars` file at `environments/prod` to describe the type of workstation you want to create - e.g.,

```terrafom
region        = "eu-west-2"
namespace     = "pytorch-dev"
ami           = "ami-0a6d88003a7f81c18"
instance_type = "p3.2xlarge"
bucket_name   = "ioannides-dev-data"
```

Descriptions for all these variables can be found in [environments/prod/variables.tf](environments/prod/variables.tf). Use the [AWS EC2 AMI Catalog](https://eu-west-2.console.aws.amazon.com/ec2/home?region=eu-west-2#AMICatalog) and available [EC2 Instance Types](https://eu-west-2.console.aws.amazon.com/ec2/home?region=eu-west-2#InstanceTypes:v=3;sort=default-otherLinux) to find a combination that meets your requirements (e.g., filter for intance types with `GPU>=1` and/or search for AMIs suited to `deep learning`, etc.).

### Initialse Terraform and Validate Deployment

Make sure that the configuration will lead to a viable deployment with the following sequence of commands,

```text
cd environments/prod
terraform init
terraform validate
terraform plan
```

If everything is okay then a viable deployment plan will be printed to stdout.

### Deploy the Workstation

```text
terraform apply -auto-approve
```

This will output an SSH command that you can use for connecting to the workstation.

```text
ssh_cmd = "ssh -i /Users/alexioannides/.ssh/pytorch-dev-workstation ec2-user@18.132.119.113"
```

Test the connection, and then from within the remote shell test that you can access the linked S3 bucket using the AWS CLI,

```text
aws s3 ls ioannides-dev-data
```

### Configuring Remote Development with Visual Studio Code

You can connect to the workstation via VS Code with the [Remote Development Extension](https://code.visualstudio.com/docs/remote/remote-overview) installed. Use the `Remote-SSH: Connect to Host...` command together with the SSH connection command generated by Terraform, to connect your IDE to the remote workstation.

### Tear Down the Workstation

Once you're done, ensure that all code commits have been pushed and that any artefacts (models, datasets, etc.) have been copied to the linked S3 bucket (or downloaded locally), and then run,

```text
terraform destroy -auto-approve
```
