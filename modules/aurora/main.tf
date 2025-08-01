# Security Group for Aurora
resource "aws_security_group" "aurora_sg" {
  name        = "${var.env}-aurora-sg"
  description = "Allow Aurora access from ECS and Bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from ECS"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = var.ecs_sg_ids
  }

  ingress {
    description     = "PostgreSQL from Bastion Host"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-aurora-sg"
    Environment = var.env
  }
}

# Aurora Subnet Group
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${var.env}-aurora-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.env}-aurora-subnet-group"
    Environment = var.env
  }
}

# Aurora Cluster
resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "${var.env}-aurora-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.db_username
  master_password         = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  skip_final_snapshot     = var.skip_final_snapshot

  tags = {
    Name        = "${var.env}-aurora-cluster"
    Environment = var.env
  }
}

# Aurora Cluster Instance (Writer)
resource "aws_rds_cluster_instance" "aurora_instance_writer" {
  identifier         = "${var.env}-aurora-writer"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible = false

  tags = {
    Name        = "${var.env}-aurora-writer"
    Environment = var.env
  }
}

# Aurora Cluster Instance (Reader for HA)
resource "aws_rds_cluster_instance" "aurora_instance_reader" {
  identifier         = "${var.env}-aurora-reader"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible = false

  tags = {
    Name        = "${var.env}-aurora-reader"
    Environment = var.env
  }
}
