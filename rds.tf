resource "aws_rds_cluster" "rds_cluster_opc" {
  cluster_identifier      = var.cluster-identifier
  engine                  = var.engine
  engine_version          = var.engine_version

  availability_zones      = [
                              data.aws_availability_zones.az.names[0],
                              data.aws_availability_zones.az.names[1]
                            ]

  database_name           = var.db_name
  master_username         = var.db_username
  master_password         = var.db_password
  port                    = var.db_port

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.rds-cluster-parameter-group.name

  backup_retention_period = 5
  preferred_backup_window = var.backup_window
  preferred_maintenance_window = var.maintenance_window

  vpc_security_group_ids  = [aws_security_group.sg_opc.id]
  db_subnet_group_name    = aws_db_subnet_group.rds-subnet-group-opc.name

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name = "OPC_RDS_CLUSTER",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}

resource "aws_rds_cluster_instance" "rds_cluster_instance_opc" {

  identifier            = var.identifier
  cluster_identifier    = aws_rds_cluster.rds_cluster_opc.id
  instance_class        = var.instance_class

  db_subnet_group_name  = aws_db_subnet_group.rds-subnet-group-opc.name

  publicly_accessible   = true
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot = true
  performance_insights_enabled = true

  engine = var.engine
  engine_version = var.engine_version

  tags = {
    Name = "OPC_RDS_INSTANCE",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}

resource "aws_rds_cluster_parameter_group" "rds-cluster-parameter-group" {
  family = "aurora-postgresql10"
  description = "configuraciones personalizadas del cluster de OPC"
  name = "opc-cluster-parameters"

  parameter {
    name = "lc_monetary"
    value = var.db_locale
  }

  parameter {
    name = "lc_numeric"
    value = var.db_locale
  }

  parameter {
    name = "lc_time"
    value = var.db_locale
  }
}
