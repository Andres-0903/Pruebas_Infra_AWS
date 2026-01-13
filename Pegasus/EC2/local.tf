locals {
  ec2_instance = [
    for id in data.aws_instance_public_instance.ids :
    {
      id = id
    }
  ]
}
