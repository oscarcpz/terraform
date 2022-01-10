# Subnets
resource "aws_subnet" "public-1-opc" {
    vpc_id = aws_vpc.vpc_opc.id
    cidr_block = var.rds_cdir_public_1
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "OPC_SUBNET_PUBLIC1",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

resource "aws_subnet" "public-2-opc" {
    vpc_id = aws_vpc.vpc_opc.id
    cidr_block = var.rds_cdir_public_2
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "OPC_SUBNET_PUBLIC2",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

resource "aws_subnet" "private-1-opc" {
    vpc_id = aws_vpc.vpc_opc.id
    cidr_block = var.rds_cdir_private_1
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "OPC_SUBNET_PRIVATE1",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

resource "aws_subnet" "private-2-opc" {
    vpc_id = aws_vpc.vpc_opc.id
    cidr_block = var.rds_cdir_private_2
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "OPC_SUBNET_PRIVATE2",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

# asociación de la tabla de rutas a la subnet
resource "aws_route_table_association" "route_table_association_opc_rds_public_1" {
  route_table_id = aws_route_table.route_table_opc.id
  subnet_id = aws_subnet.public-1-opc.id
}

resource "aws_route_table_association" "route_table_association_opc_rds_public_2" {
  route_table_id = aws_route_table.route_table_opc.id
  subnet_id = aws_subnet.public-2-opc.id
}

resource "aws_db_subnet_group" "rds-subnet-group-opc" {
  name = "rds-subnet-group-opc"
  description = "RDS subnet group"
  subnet_ids = [aws_subnet.public-1-opc.id, aws_subnet.public-2-opc.id, aws_subnet.subnet_opc.id]

  tags = {
    Name = "OPC_RDS_SUBNET_GROUP",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}
