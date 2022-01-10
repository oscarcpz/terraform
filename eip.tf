# Elastic IP
resource "aws_eip" "eip_opc" {

  vpc = true

  tags = {
    Name = "OPC-EIP",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}

# Asociacion de la Elastic IP con la instancia
resource "aws_eip_association" "eip_opc_association" {
  instance_id = aws_instance.ec2_opc.id
  allocation_id = aws_eip.eip_opc.id
}

# Internet Gateway - necesaria para poder acceder desde el exterior a la máquina
resource "aws_internet_gateway" "ig_opc" {
  vpc_id = aws_vpc.vpc_opc.id

  tags = {
    Name = "OPC-IG",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}