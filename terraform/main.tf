module "network" {
    source = "./network"
    vpc_cidr = var.vpc_cidr
    priv_cidr = var.priv_cidr
    pub_cidr = var.pub_cidr
    aws_region = var.aws_region
}


