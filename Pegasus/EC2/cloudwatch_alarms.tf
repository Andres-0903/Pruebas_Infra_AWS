module "cloudwatch_alarms_silence" {
  source = "github.com/Andres-0903/cloudwatch-alarms-scheduler?ref=1.0.3"

  alarm_names = [
    "monitoreo-EC2-CPUUtilization-Apache-dev",
    "monitoreo-EC2-CPUUtilization-Nginx-dev",
    "monitoreo-EC2-CPUUtilization-NodeJS-dev",
    "monitoreo-EC2-CPUUtilization-MongoDB-dev"
  ]

  mute_cron   = "cron(45 17 * * ? *)" # 01:45 PM
  unmute_cron = "cron(00 18 * * ? *)" # 02:00 PM
}
