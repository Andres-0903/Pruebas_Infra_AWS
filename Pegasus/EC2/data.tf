data "aws_key_pair" "my_key" {
  key_name = "my_key"
}

data "aws_instance" "monitoreo" {
  filter {
    name   = "tag:Name"
    values = ["monitoreo1", "monitoreo2", "monitoreo3"]
  }
}
