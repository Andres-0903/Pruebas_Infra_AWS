locals {
  ec2_instance = [
    for id in data.aws_instace_monitoreo.ids :
    {
      id = id
    }
  ]
}
