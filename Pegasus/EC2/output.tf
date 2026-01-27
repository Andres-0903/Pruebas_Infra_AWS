output "ec2_instances" {
  description = "Mapa de instancias EC2 por nombre"
  value       = local.ec2_instances_by_name
}
