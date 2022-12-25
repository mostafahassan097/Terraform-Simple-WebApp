resource "aws_instance" "webserver" {
  
  instance_type= "t3a.micro"
  
  ami = "ami-0b5eea76982371e91" #Amazon Linux US-East
  associate_public_ip_address = true
  subnet_id = aws_subnet.webserver-subnet.id
  
  security_groups = [aws_security_group.webserver-sg.id]
  
  ebs_optimized = false
  
  root_block_device {
    volume_size = 20
  }
# Bootstrap Script to install httpd and Print private IP addresse
user_data = <<EOF
#!/bin/bash
#!/bin/bash
yum update -y
yum install httpd -y
echo "<h1>Hello Webserver My Private IP is : $(hostname -I) </h1>" >> /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
EOF
  tags = {
    "Name" = "webserver"
  }
}

#Output DNS Name to Access Webserver
output "access-webserver" {
  description = "Public Ip address to access webserver"
  value       = aws_instance.webserver.public_dns
}