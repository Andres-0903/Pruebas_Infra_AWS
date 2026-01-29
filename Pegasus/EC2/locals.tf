
locals {
  # Mapa: nombre => objeto con id (known after apply)
  ec2_instances_by_name = {
    for name, inst in aws_instance.public_instance :
    name => { id = inst.id }
  }
}
