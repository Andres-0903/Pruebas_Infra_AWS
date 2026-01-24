viriginia_cidr = "10.10.0.0/16"

subnets_cidr = ["10.10.0.0/24", "10.10.1.0/24"]

sg_cidr_shh = "0.0.0.0/0"

ec2_specs = {
  "ami"  = "ami-0532be01f26a3de55"
  "type" = "t3a.micro"
}

tags_generales = {
  "env"         = "Dev"
  "owner"       = "Andres"
  "IAC"         = "Terraform"
  "cloud"       = "AWS"
  "project"     = "Pegasus-monitoring"
  "version IaC" = "v1.13"
}

instancias = ["Apache", "MySQL", "Java"]

project = "Monitoreo"

environment = "Dev"

# sns_topic_arn = ["arenasandres7@gmail.com"]
