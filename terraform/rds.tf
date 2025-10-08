resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds"
  subnet_ids = ["${module.network.private_subnet_id}", "${module.network.private_subnet2_id}"]
  tags = {
    Name = "MY RDS"
  }
}


resource "aws_db_instance" "rds" {
  allocated_storage           = 10
  db_name                     = var.db_name
  engine                      = var.rds_engine
  engine_version              = var.rds_engine_version
  instance_class              = var.instance_class
  username                    = var.username
  password                    = var.password
  allow_major_version_upgrade = true
  parameter_group_name        = var.parameter_group_name
  availability_zone           = "${var.aws_region}a"
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  db_subnet_group_name        = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot         = true
}


# Elasic cache

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "cache-subnets"
  subnet_ids = ["${module.network.private_subnet_id}", "${module.network.private_subnet2_id}"]
}

resource "aws_elasticache_cluster" "ec" {
  cluster_id           = var.cluster_id
  engine               = var.ec_engine
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = var.ec_engine_version
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = [aws_security_group.elastic_cache_sg.id]
}


