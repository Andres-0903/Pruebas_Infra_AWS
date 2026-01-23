###Variables Network###
variable "viriginia_cidr" {
  description = "CIDR Virginia"
  type        = string
}

variable "subnets_cidr" {
  description = "CIDR de las subnets"
  type        = list(string)
}


variable "sg_cidr_shh" {
  description = "CIDR SG"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN del SNS Topic"
  type        = list(string)
}

###Variables EC2###
variable "ec2_specs" {
  description = "caracteristicas  de la instancia EC2"
  type        = map(string)
}

variable "tags_generales" {
  description = "tags generales"
  type        = map(string)
}

variable "instancias" {
  description = "Nombre de las instancias"
  type        = set(string)
}


###Variables generales
variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}



