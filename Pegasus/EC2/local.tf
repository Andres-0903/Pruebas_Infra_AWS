locals {
  ec2_instances = {
    for name, inst in aws_instance.public_instance :
    name => {
      id = inst.id
    }
  }
}
