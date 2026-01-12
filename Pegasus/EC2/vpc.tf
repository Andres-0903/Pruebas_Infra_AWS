####
#Datos VPC
##
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.viriginia_cidr
  tags = {
    Name = "vpc_virginia"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_cidr[1]

  tags = {
    "Name" = "Private_subnet"
  }
  depends_on = [aws_vpc.vpc_virginia]
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_cidr[0]

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

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

}

resource "aws_route" "route" {
  route_table_id = aws_route_table.route_table.id
  gateway_id     = aws_internet_gateway.internet_gateway.id
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
