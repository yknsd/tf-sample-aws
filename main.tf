terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


module "iam" {
  source = "./modules/iam"
}

module network {
  source = "./modules/network"

  region = var.region
}

module "s3" {
  source = "./modules/s3"
}

module "ec2" {
  source = "./modules/ec2"

  key_name      = ""
  sg_ids        = [module.network.security_group_ec2_id]
  subnet_id     = element(module.network.private_subnet_ids, 0)
}

module "elastic_load_balancing" {
  source = "./modules/elastic_load_balancing"

  vpc_id                      = module.network.vpc_id
  access_log_s3_bucket_id     = module.s3.s3_bucket_example_id
  lb_listener_security_policy = var.aws_lb_listener_security_policy
  ec2_sample_server_1_id      = module.ec2.aws_instance_sample_server_1_id
  alb_security_group_id       = module.network.security_group_alb_id
  alb_subnets                 = module.network.public_subnet_ids
}

module "efs" {
  source = "./modules/efs"
  sg_ids = [module.network.security_group_efs_id]
}
//
//module "elastic_block_storage" {
//  source = "./modules/elastic_block_storage"
//}
//
module "rds" {
  source = "./modules/rds"

}

//module "elasti_cache" {
//  source = "modules/elasti_cache"
//}
//
//module "code_pipeline" {
//  source = "./modules/code_pipeline"
//}

//module "cloud_watch" {
//  source = "./modules/cloud_watch"
//
//  region = var.region
//}

//module "cloud_front" {
//  source = "./modules/cloud_front"
//}
