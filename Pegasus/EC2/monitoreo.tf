# module "ec2_monitoring" {
#   source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.3"

#   ec2_instances = local.ec2_instances
#   project       = "monitoreo"
#   environment   = "dev"
#   sns_topic_arn = var.sns_topic_arn
# }
