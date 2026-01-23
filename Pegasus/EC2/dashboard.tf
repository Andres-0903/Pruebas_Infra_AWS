resource "aws_cloudwatch_dashboard" "ec2_metrics_dashboard" {
  dashboard_name = "ec2_metrics_dashboard-${var.project}-${var.environment}"

  dashboard_body = jsonencode({
    widgets = flatten([
      [
        for name, inst in aws_instance.public_instance : {
          type   = "metric"
          x      = 0
          y      = 0
          width  = 24
          height = 6

          properties = {
            title  = "CPU Utilization - ${name}"
            region = "us-east-1"
            metrics = [
              ["AWS/EC2", "CPUUtilization", "InstanceId", inst.id]
            ]
            period = 60
            stat   = "Average"
            view   = "timeSeries"
          }
        }
      ],
      [
        for name, inst in aws_instance.public_instance : {
          type   = "metric"
          x      = 0
          y      = 6
          width  = 24
          height = 6

          properties = {
            title  = "Memory Utilization - ${name}"
            region = "us-east-1"
            metrics = [
              ["CWAgent", "mem_used_percent", "InstanceId", inst.id]
            ]
            period = 60
            stat   = "Average"
            view   = "timeSeries"
          }
        }
      ],
      [
        for name, inst in aws_instance.public_instance : {
          type   = "metric"
          x      = 0
          y      = 12
          width  = 24
          height = 6

          properties = {
            title  = "Disk Utilization - ${name}"
            region = "us-east-1"
            metrics = [
              ["CWAgent", "disk_used_percent", "InstanceId", inst.id, "path", "/", "fstype", "xfs"]
            ]
            period = 60
            stat   = "Average"
            view   = "timeSeries"
          }
        }
      ]
    ])
  })
}
