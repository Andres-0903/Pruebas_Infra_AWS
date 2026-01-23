viriginia_cidr = "10.10.0.0/16"

subnets_cidr = ["10.10.0.0/24", "10.10.1.0/24"]

sg_cidr_shh = "0.0.0.0/0"

ec2_specs = {
  "ami"  = "ami-068c0051b15cdb816"
  "type" = "t2.micro"
}

tags_generales = {
  "env"         = "Dev"
  "owner"       = "Andres"
  "IAC"         = "Terraform"
  "cloud"       = "AWS"
  "project"     = "Pegasus-monitoring"
  "version IaC" = "v1.13"
}

instancias = ["monitoreo1", "monitoreo2", "monitoreo3"]

project = "Monitoreo"

environment = "Dev"

# ec2_instances = [{
#   id = ""
# }]

# sns_topic_arn = [""]
