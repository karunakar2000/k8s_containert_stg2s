data "aws_ami" "devsecops" {
  most_recent = true
  owners      = ["309956199498"]

  filter {
    name   = "name"
    values = ["RHEL-9.6.0_HVM-20250618-x86_64-0-Hourly2-GP3"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.devsecops.id
}

data "aws_instance" "redis" {
  instance_id = "i-0a568aca108faba1a"
}

output "redis_info" {
  value = data.aws_instance.redis.public_ip
}