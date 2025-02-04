# 1 vpc , 1 subnet and 1 SG
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true 
    enable_dns_support = true

    tags = {
      Name = "myvpc"
    }
  
}
resource "aws_subnet" "pb_sn" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
      Name ="pb_sn1"
    }

  
}
resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "my_sg"
    description = "Public Security Group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}