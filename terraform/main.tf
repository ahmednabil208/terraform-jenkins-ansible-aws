module "network" {
  source     = "./network"
  vpc_cidr   = var.vpc_cidr
  priv_cidr  = var.priv_cidr
  priv2_cidr = var.priv2_cidr
  pub_cidr   = var.pub_cidr
  pub2_cidr   = var.pub2_cidr
  aws_region = var.aws_region
}


