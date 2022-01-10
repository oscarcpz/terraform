# Terraform

Este proyecto contiene toda la infraestructura como código definida en Terraform para un proyecto llamado **OPC**

## Arquitectura

- Se define una EC2 que conecta con una RDS. 
- El acceso a la EC2 desde el exterior se realiza mediante una Elastic IP. 
- La RDS no tiene acceso al exterior y solo se puede acceder a ella desde la EC2.
- La RDS dispone de 4 subnets: 2 publicas y 2 privadas

## Ficheros

* ec2.tf - definicion de la instancia EC2
* eip.tf - definicion de la Elastic IP o IP publica necesaria para poder acceder desde el exterior
* main.tf - fichero principal de Terraform donde se define el proveedor cloud
* output.tf - definicion de los parametros de salida cuando se ejecutan los scripts. Para poder preguntar a Terraform valores concretos de los servicios que se han creado
* rds.tf - definicion de la base de datos RDS Aurora Postgres
* security_groups.tf - definicion de los grupos de seguridad que se necesitan en esta infraestructura
* variables.tf - todos los parametros configurables para esta infraestructura. Ojo, aquí hay valores que se deben indicar antes de poder ser ejecutado todo este codigo
* vpc_ec2.tf - definicion de la VPC necesaria para la EC2
* vpc_rds.tf - definicion de las VPC necesarias para conectar la RDS