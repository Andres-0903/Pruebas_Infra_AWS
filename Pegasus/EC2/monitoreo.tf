# module "ec2_instances" {
#     source = "https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2/tree/1.0.1"  

# }

module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.1"

  ec2_instances = ["i-09e760154b7e7c682", "i-09e760154b7e7c682", "i-089305ba0767eb28d"]
  project       = "monitoreo"
  environment   = "dev"
}
