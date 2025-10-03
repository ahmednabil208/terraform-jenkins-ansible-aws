variable "vpc_cidr" {
  type    = string
}

variable "pub_cidr" {
  type    = string
}

variable "priv_cidr" {
  type    = string
}

variable "priv2_cidr" {
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