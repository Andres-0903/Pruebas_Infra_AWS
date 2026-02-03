module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.4"

  ec2_instances = local.ec2_instances_by_name
  project       = "monitoreo"
  environment   = "dev"
  sns_topic_arn = [aws_sns_topic.sns_ec2.arn]

  cpu_utilization_evaluation_periods = 1
  cpu_utilization_period             = 60
  cpu_utilization_threshold          = 40

  memory_utilization_threshold_evaluation_periods = 1
  memory_utilization_period                       = 60
  memory_utilization_threshold                    = 50
}


#####################Modulo silenciador de alarmas##################################
module "cloudwatch_alarms_scheduler" {
  source = "git::https://github.com/Andres-0903/cloudwatch-alarms-scheduler.git//CloudwatchSilence?ref=1.0.5"

  name_prefix = "myapp"
  alarm_names = ["high-cpu-alarm", "http-5xx-errors", "latency-p99"]

  # 00:00→01:00 UTC
  mute_cron   = "cron(30 23 * * ? *)" #06:30 PM
  unmute_cron = "cron(45 23 * * ? *)" #06:45 PM
}
