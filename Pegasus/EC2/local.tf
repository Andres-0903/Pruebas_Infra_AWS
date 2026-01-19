locals {
  ec2_instances = [
    for id in values(aws_instance.public_instance)[*].id :
    {
      id = id
    }
  ]
}
