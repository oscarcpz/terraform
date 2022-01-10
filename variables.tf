variable "account_id" {
  type = "string"
  default = "<numero de la cuenta de AWS>"
  description = "id de la cuenta de AWS"
}

variable "region" {
  type = "string"
  default = "eu-west-1"
}

variable "key_name" {
  type = "string"
  default = "fichero.pem"
  description = "Nombre del fichero pem creado y cargado previamente"
}

variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "root_storage_size" {
  type = "string"
  default = 50 # GB
}

variable "cidr" {
  type = "string"
  default = "10.0.0.0/16"
}

variable "cdir_subnet" {
  type = "string"
  default = "10.0.0.0/24"
}

# SUBNETS de RDS
variable "rds_cdir_public_1" {
  type = "string"
  default = "10.0.1.0/24"
}

variable "rds_cdir_public_2" {
  type = "string"
  default = "10.0.2.0/24"
}

variable "rds_cdir_private_1" {
  type = "string"
  default = "10.0.4.0/24"
}

variable "rds_cdir_private_2" {
  type = "string"
  default = "10.0.5.0/24"
}

# Variables para RDS

variable "cluster-identifier" {
  type = "string"
  default = "rds-cluster-opc"
}

variable "identifier" {
  type = "string"
  default = "rds-instance-opc"
}

variable "storage_size" {
  type = "string"
  default = 50 #GB
}

variable "engine" {
  type = "string"
  default = "aurora-postgresql"
}

variable "engine_version" {
  type = "string"
  default = "12.7" # https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.Updates.20180305.html
}

variable "instance_class" {
  type = "string"
  default = "db.r4.large"
}

variable "db_name" {
  type = "string"
  default = "opc"
}

variable "db_username" {
  type = "string"
  default = "<db_user_name>"
}

variable "db_password" {
  type = "string"
  default = "<db_password>"
}

variable "db_port" {
  type = "string"
  default = 5432
}

variable "db_locale" {
  type = "string"
  default = "es_ES.utf8"
}

variable "maintenance_window" {
  type = "string"
  default = "sun:04:30-sun:05:30"
}

variable "backup_window" {
  type = "string"
  default = "04:00-04:30"
}

# IPs para los grupos de seguridad
variable "ip_publica_oficina" {
  type = "string"
  default = "111.222.333.444/32"
}

# TAGS
variable "tag_project" {
  type = "string"
  default = "OPC"
}

variable "tag_owner" {
  type = "string"
  default = "oscarcpz"
}

variable "tag_creator" {
  type = "string"
  default = "Terraform"
}
