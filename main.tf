# Fargate node groups 
terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# vpc

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.78.0"
  name               = "eks_vpc"
  azs                = var.azs
  cidr               = "10.0.0.0/18"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = module.eks.tags.shared
}

# eks

module "eks" {
  source               = "danielbatubenga/eks/aws"
  version              = "1.7.10"
  name                 = var.name
  tags                 = var.tags
  subnets              = module.vpc.private_subnets
  kubernetes_version   = var.kubernetes_version
  managed_node_groups  = var.managed_node_groups
  node_groups          = var.node_groups
  fargate_profile      = var.fargate_profile
}