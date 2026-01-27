viriginia_cidr = "10.10.0.0/16"

subnets_cidr = ["10.10.0.0/24", "10.10.1.0/24"]

sg_cidr_shh = "0.0.0.0/0"

ec2_specs = {
  "ami"  = "ami-0532be01f26a3de55"
  "type" = "t3a.micro"
}

instancias = {
  "Apache" = {
    instance_id = "i-0bb1c2d3e4f5a6b7c"
  }
  "MySql" = {
    instance_id = "i-1aa2b3c4d5e6f7g8h"
  }

  "Java" = {
    instance_id = "i-2cc3d4e5f6g7h8i9j"
  }
}



tags_generales = {
  "env"         = "Dev"
  "owner"       = "Andres"
  "IAC"         = "Terraform"
  "cloud"       = "AWS"
  "project"     = "Pegasus-monitoring"
  "version IaC" = "v1.13"
}



project = "Monitoreo"

environment = "Dev"

# sns_topic_arn = ["arenasandres7@gmail.com"]
