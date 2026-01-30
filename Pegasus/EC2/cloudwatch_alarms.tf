module "cloudwatch_alarms_silence" {
  source = "github.com/Andres-0903/cloudwatch-alarms-scheduler//CloudwatchSilence?ref=1.0.4"

  alarm_names = [
    "monitoreo-EC2-CPUUtilization-Apache-dev",
    "monitoreo-EC2-CPUUtilization-Nginx-dev",
    "monitoreo-EC2-CPUUtilization-NodeJS-dev",
    "monitoreo-EC2-CPUUtilization-MongoDB-dev"
  ]

  mute_cron   = "cron(20 19 * * ? *)" # 02:20 PM
  unmute_cron = "cron(30 19 * * ? *)" # 02:30 PM
}
