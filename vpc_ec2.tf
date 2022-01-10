# creación de una VPC para la instancia
resource "aws_vpc" "vpc_opc" {
  cidr_block = var.cidr
  enable_dns_hostnames = true # para resolver nombres internos entre ellas
  enable_dns_support = true

  tags = {
    Name = "OPC_VPC",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

# creación de una subnet para la VPC
resource "aws_subnet" "subnet_opc" {
  cidr_block = var.cdir_subnet
  vpc_id = aws_vpc.vpc_opc.id
  # map_public_ip_on_launch = true # para que la instancia se levante directamente con ip publica
  availability_zone = data.aws_availability_zones.az.names[0]
  depends_on = ["aws_vpc.vpc_opc"]

  tags = {
    Name = "OPC-SUBNET",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}

# definición de la tabla de rutas - necesario para poder tener acceso desde el exterior
resource "aws_route_table" "route_table_opc" {
  vpc_id = aws_vpc.vpc_opc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_opc.id
  }

  tags = {
    Name = "OPC-ROUTE_TABLE",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}

# asociación de la tabla de rutas a la subnet
resource "aws_route_table_association" "route_table_association_opc" {
  route_table_id = aws_route_table.route_table_opc.id
  subnet_id = aws_subnet.subnet_opc.id
}