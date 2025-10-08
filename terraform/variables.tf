variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "pub_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "priv_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "priv2_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

variable "ami" {
  default = "ami-0360c520857e3138f"
  type    = string
}

variable "instance_type" {
  default = "t3.micro"
  type    = string
}

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

# RDS Variables

variable "db_name" {
  type    = string
  default = "mydb"
}

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_engine_version" {
  type    = string
  default = "8.0.35"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "username" {
  type    = string
  default = "ahmed"
}

variable "password" {
  type    = string
  default = "password123"
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql8.0"
}



# Elastic Casche variables

variable "cluster_id" {
  type    = string
  default = "cluster"
}

variable "ec_engine" {
  type    = string
  default = "redis"
}

variable "node_type" {
  type    = string
  default = "cache.m4.large"
}

variable "ec_engine_version" {
  type    = string
  default = "7.1"
}

