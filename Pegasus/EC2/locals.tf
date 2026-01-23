
locals {
  # Genera list(object({ id = string }))
  ec2_instances = [
    for inst in aws_instance.public_instance :
    {
      id = inst.id
    }
  ]
}
