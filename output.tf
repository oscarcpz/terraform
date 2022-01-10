# muestra la ip creada en la elastic ip
output "server_ip" {
  value = aws_eip.eip_opc.public_ip
}

# muestra las zonas disponibles en la región de trabajo
output "az" {
  value = data.aws_availability_zones.az.names
}

# obtener el endpoint de la base de datos
output "rds-cluster-endpoint" {
  value = aws_rds_cluster.rds_cluster_opc.endpoint
}

output "rds-cluster-instance-endpoint" {
  value = aws_rds_cluster_instance.rds_cluster_instance_opc.endpoint
}