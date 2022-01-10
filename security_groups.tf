resource "aws_security_group" "sg_opc" {
  name = "sg-opc"
  vpc_id = aws_vpc.vpc_opc.id
  depends_on = [aws_vpc.vpc_opc]

  # Reglas de entrada
  ingress { # SSH
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [var.ip_publica_oficina] # Direccion desde la que queremos conectar a la maquina
    description = "Direccion desde la que queremos conectar a la maquina"
  }

  # Reglas de salida
  egress {
    from_port = 0 # a cualquier puerto
    protocol = "-1" # cualquier protocolo
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "OPC_SG",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }
}