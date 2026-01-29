module "cloudwatch_alarms_silence" {
  source = "github.com/Andres-0903/cloudwatch-alarms-scheduler?ref=1.0.3"

  alarm_names = [
    "monitoreo-EC2-CPUUtilization-Apache-dev",
    "monitoreo-EC2-CPUUtilization-Nginx-dev",
    "monitoreo-EC2-CPUUtilization-NodeJS-dev",
    "monitoreo-EC2-CPUUtilization-MongoDB-dev"
  ]

  mute_cron   = "cron(00 20 * * ? *)" # 03:00 PM
  unmute_cron = "cron(10 20 * * ? *)" # 03:10 PM
}
