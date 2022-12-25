#VPC
resource "aws_vpc" "simple-web-app" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames= true

  tags = {
    Name = "simple-web-app"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "Web-IGW" {
  vpc_id = aws_vpc.simple-web-app.id

  tags = {
    Name = "Web-IGW"
  }
}

# Public Subnet

resource "aws_subnet" "webserver-subnet" {
  vpc_id     = aws_vpc.simple-web-app.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "webserver-subnet"
  }
}

# Route Table

resource "aws_route_table" "webserver-rt" {
  vpc_id = aws_vpc.simple-web-app.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Web-IGW.id
  }

}

# Route Table Association
resource "aws_route_table_association" "webserver-rt-assoc"{
    subnet_id = aws_subnet.webserver-subnet.id
    route_table_id = aws_route_table.webserver-rt.id
}


# Security Group 
resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "Allow Http and SSH traffic"
  vpc_id      = aws_vpc.simple-web-app.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "webserver-sg"
  }
}