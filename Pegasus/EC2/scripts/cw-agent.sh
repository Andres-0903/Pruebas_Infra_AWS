#!/bin/bash
set -e

if [ -f /etc/os-release ]; then
  . /etc/os-release
  if [[ "$ID" == "amzn" || "$ID" == "amazon" ]]; then
    yum update -y
    yum install -y amazon-cloudwatch-agent
  elif [[ "$ID" == "ubuntu" ]]; then
    apt update -y
    apt install -y amazon-cloudwatch-agent
  fi
fi

cat <<'CONFIG' > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
  "agent": {
    "metrics_collection_interval": 60,
    "run_as_user": "root"
  },
  "metrics": {
    "append_dimensions": {
      "InstanceId": "${aws:InstanceId}"
    },
    "metrics_collected": {
      "cpu": {
        "measurement": [
          "cpu_usage_idle",
          "cpu_usage_user",
          "cpu_usage_system"
        ],
        "totalcpu": true
      },
      "mem": {
        "measurement": [
          "mem_used_percent"
        ]
      },
      "disk": {
        "measurement": [
          "used_percent"
        ],
        "resources": ["/"]
      }
    }
  }
}
CONFIG

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
-s
