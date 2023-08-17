provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "subnet" {
  source              = "./modules/subnet"
  count               = 1
  subnet_cidr         = ["10.0.1.0/24"]
  vpc_id              = module.vpc.vpc_id
}

module "instance" {
  source        = "./modules/instance"
  instance_count = 2
  subnet_ids    = module.subnet.public_subnet_ids
}
