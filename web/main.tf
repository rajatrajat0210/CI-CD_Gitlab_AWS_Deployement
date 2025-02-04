#ec2 

resource "aws_instance" "server" {
    ami = "ami-0c614dee691cbbf37"
    instance_type = "t2.micro"
    subnet_id = var.sn
    security_groups = [var.sg]


    tags = {
        Name = "myserver"
    }
  
}