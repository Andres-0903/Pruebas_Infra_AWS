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

###
#Datos Internet Gateway
##
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    "Name" = "Internet_gateway"
  }
}

###
#Datos Route Table
##
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    "Name" = "Route_table"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

###
#Datos Route Table Association
##
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

###
#Datos Security Group
##
resource "aws_security_group" "SG_Allow_SSH_HTTP" {
  name        = "SG_Allow_SSH_HTTP"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # salida TOTAL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###
#Datos instancia Ec2
###
resource "aws_instance" "public_instance" {
  ami                    = "ami-068c0051b15cdb816"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.SG_Allow_SSH_HTTP.id]

  tags = {
    Name  = "public_instance"
    Owner = "Andres"
  }
}

data "aws_key_pair" "my_key" {
  key_name = "my_key"
}

