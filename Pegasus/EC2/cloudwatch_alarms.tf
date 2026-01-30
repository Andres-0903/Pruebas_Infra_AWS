module "cloudwatch_alarms_silence" {
  source = "github.com/Andres-0903/cloudwatch-alarms-scheduler//CloudwatchSilence?ref=1.0.4"

  alarm_names = [
    "monitoreo-EC2-CPUUtilization-Apache-dev",
    "monitoreo-EC2-CPUUtilization-Nginx-dev",
    "monitoreo-EC2-CPUUtilization-NodeJS-dev",
    "monitoreo-EC2-CPUUtilization-MongoDB-dev"
  ]

  mute_cron   = "cron(20 14 * * ? *)" # 09:20 AM
  unmute_cron = "cron(30 14 * * ? *)" # 09:30 AM
}
