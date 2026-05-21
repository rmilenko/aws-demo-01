resource "aws_db_instance" "rds-instance" {
  identifier            = "rds-instance"
  allocated_storage     = 20
  max_allocated_storage = 100
  instance_class        = var.db-instance-class
  engine                = "postgres"
  engine_version        = "18.3"
  username              = "postgres"
  password             = var.db-password
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-group.name
  parameter_group_name = aws_db_parameter_group.rds-pg.name
  skip_final_snapshot  = true
  apply_immediately    = true
}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = var.rds-subnet-ids
}

resource "aws_db_parameter_group" "rds-pg" {
  family = "postgres18"
  name   = "rds-parameter-group-18"
}
