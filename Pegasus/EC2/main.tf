####
#Datos VPC
##
resource "aws_vpc" "vpc_virginia" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_virginia"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "Private_subnet"
  }
  depends_on = [aws_vpc.vpc_virginia]
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = "10.0.2.0/24"

  tags = {
    "Name" = "Public_subnet"
  }
  depends_on              = [aws_vpc.vpc_virginia]
  map_public_ip_on_launch = true
}
