resource "aws_instance" "terraform" {
  # for_each = var.ec2
  for_each = toset(var.ec2)
  ami = "ami-0dfc569a8686b9320"
  # instance_type = each.value
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.tf_sg_all.id]

  tags = {
      Name      = each.key
      Terraform = "true"
  }
}

resource "aws_security_group" "tf_sg_all" {
  name        = "tf_sg_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0 # from 0 port to 0 port means all ports are open 
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols 
    cidr_blocks = ["0.0.0.0/0"] # internet access 

  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf_sg_all"
  }

}