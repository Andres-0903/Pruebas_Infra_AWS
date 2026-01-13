# module "ec2_instances" {
#     source = "https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2/tree/1.0.1"  

# }

module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.2"

  ec2_instances = var.ec2_instances
  project       = "monitoreo"
  environment   = "dev"
  sns_topic_arn = var.sns_topic_arn
}
