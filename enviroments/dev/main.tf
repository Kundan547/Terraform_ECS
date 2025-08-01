provider "aws" {
  region = "us-east-1"
}

# Fetch Public IP dynamically
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com/"
}

locals {
  my_ip_cidr = "${chomp(data.http.my_ip.response_body)}/32"
}

# VPC
module "vpc" {
  source = "../../modules/vpc"
  env    = var.env
}

# Security Groups
module "security_groups" {
  source      = "../../modules/security_groups"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  ecs_port    = 80
  allowed_ip  = local.my_ip_cidr
}

# Key Pair
module "keypair" {
  source          = "../../keypair"
  env             = var.env
  public_key_path = "${path.module}/../../keypair/bastion-key.pub"
}

# Bastion Host
module "bastion" {
  source           = "../../modules/bastion"
  env              = var.env
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = element(module.vpc.public_subnets, 0)
  key_name         = module.keypair.key_name
  ami_id           = var.bastion_ami_id
  rds_sg_id        = module.security_groups.rds_sg_id
}



# Aurora DB
module "aurora" {
  source             = "../../modules/aurora"
  env                = var.env
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  ecs_sg_ids         = [module.security_groups.ecs_sg_id]
  bastion_sg_id      = module.security_groups.bastion_sg_id
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
}

# ALB
module "alb" {
  source              = "../../modules/alb"
  env                 = var.env
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnets
  acm_certificate_arn = module.acm.acm_certificate_arn
}

# ACM
module "acm" {
  source          = "../../modules/acm"
  env             = var.env
  prod_domain     = var.prod_domain
  dev_domain      = var.dev_domain
  hosted_zone_id  = var.hosted_zone_id
}

# Route 53
module "route53" {
  source          = "../../modules/route53"
  prod_domain     = var.prod_domain
  dev_domain      = var.dev_domain
  hosted_zone_id  = var.hosted_zone_id
  alb_dns_name    = module.alb.alb_dns_name
  alb_zone_id     = module.alb.alb_zone_id
}

# ECR
module "ecr" {
  source    = "../../modules/ecr"
  env       = var.env
  repo_name = "panda"
}

# ECS
module "ecs" {
  source              = "../../modules/ecs"
  env                 = var.env
  private_subnet_ids  = module.vpc.private_subnets
  security_group_ids  = [module.security_groups.ecs_sg_id]
  container_image     = module.ecr.repository_url
  container_port      = 80
  target_group_arn    = module.alb.target_group_arn
  alb_listener        = module.alb.https_listener_arn
}

# S3 for State & Assets
module "s3" {
  source      = "../../modules/s3"
  env         = var.env
  bucket_name = "terraform-state"
}

# GitHub OIDC Role
module "github_oidc_role" {
  source      = "../../modules/github_oidc_role"
  env         = var.env
  account_id  = var.account_id
  github_repo = var.github_repo
}

