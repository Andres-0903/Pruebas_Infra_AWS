data "aws_key_pair" "my_key" {
  key_name = "my_key"
}

data "aws_instance" "public_instance" {
  filter {
    name   = "tag:Name"
    values = ["monitoreo1", "monitoreo2", "monitoreo3"]
  }
}
