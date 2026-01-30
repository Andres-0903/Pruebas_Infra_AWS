module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.4"

  ec2_instances = local.ec2_instances_by_name
  project       = "monitoreo"
  environment   = "dev"
  sns_topic_arn = [aws_sns_topic.sns_ec2.arn]

  cpu_utilization_evaluation_periods = 1
  cpu_utilization_period             = 120
  cpu_utilization_threshold          = 40

  memory_utilization_threshold_evaluation_periods = 1
  memory_utilization_period                       = 120
  memory_utilization_threshold                    = 50
}


