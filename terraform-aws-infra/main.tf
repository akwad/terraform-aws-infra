module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  project = var.project
}
module "alb_ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnet_ids
  project = var.project
}
module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnet_ids
  project = var.project
  username = var.db_username
  password = var.db_password
}
