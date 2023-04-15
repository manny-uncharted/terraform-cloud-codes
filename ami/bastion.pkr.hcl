variable "region" {
  type    = string
  default = "us-east-1"
}

variable "subnet_id" {
  type    = list(string)
  default = ["subnet-00cbf83e10e2a3784",
    "subnet-038065fc82cc5f937"]
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioners and post-processors on a
# source.
source "amazon-ebs" "terraform-bastion-prj-19" {
  ami_name      = "terraform-bastion-prj-19-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  vpc_id = "vpc-07de1c0bf612531a5"
  subnet_id = var.subnet_id[0]

  source_ami_filter {
    filters = {
      name                = "RHEL-8.6.0_HVM-20220503-x86_64-2-Hourly2-GP2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["309956199498"]
  }
  ssh_username = "ec2-user"
  tag {
    key   = "Name"
    value = "terraform-bastion-prj-19"
  }
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.terraform-bastion-prj-19"]

  provisioner "shell" {
    script = "bastion.sh"
  }
}