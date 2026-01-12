output "ec2_instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = values(aws_instance.public_instance)[*].id
}
