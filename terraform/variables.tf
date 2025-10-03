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