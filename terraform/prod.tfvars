vpc_cidr = "173.0.0.0/16"

pub_cidr = "173.0.1.0/24"

priv_cidr = "173.0.2.0/24"

priv2_cidr = "173.0.3.0/24"

ami = "ami-0360c520857e3138f"

instance_type = "t3.micro"

aws_region = "us-east-1"



# RDS VAlues
db_name              = "mydb"
rds_engine           = "mysql"
rds_engine_version   = "8.0.37"
instance_class       = "db.t3.micro"
username             = "admin"
password             = "password123"
parameter_group_name = "default.mysql8.0"


# Elastic Cache
cluster_id        = "cluster"
ec_engine         = "redis"
node_type         = "cache.m4.large"
ec_engine_version = "7.1"






