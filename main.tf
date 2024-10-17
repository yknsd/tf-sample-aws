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

module "ec2" {
  source = "./modules/ec2"
}

module "s3" {
  source = "./modules/s3"
}

//module "efs" {
//  source = "./modules/efs"
//}
//
//module "elastic_block_storage" {
//  source = "./modules/elastic_block_storage"
//}
//
//module "rds" {
//  source = "./modules/rds"
//
//}
//
//module "elasti_cache" {
//  source = "modules/elasti_cache"
//}
//
//module "elastic_load_balancing" {
//  source = "./modules/elastic_load_balancing"
//}
//
//module "code_pipeline" {
//  source = "./modules/code_pipeline"
//}
