module "security_group" {

  source = "../modules/security-group"

  sg_name     = "dev-sg"
  description = "Security group for dev EC2"

  ssh_cidr = [
    "0.0.0.0/0"
  ]
}



module "ec2" {

  source = "../modules/ec2"

  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_name  = var.instance_name

  security_group_ids = [
    module.security_group.security_group_id
  ]
}

module "vpc" {

  source = "../modules/vpc"

  vpc_name = "dev-vpc"
  vpc_cidr = "10.0.0.0/16"

}