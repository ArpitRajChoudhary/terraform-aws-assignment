terraform {
  backend "s3" {
    bucket         = "arpit-tf-state-xyz"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_ids      = module.ec2.instance_ids

}


module "ec2" {
  source = "./modules/ec2"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  alb_sg_id          = module.alb.alb_sg_id

  instance_count = 2
}
