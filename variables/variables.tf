variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name      = "Terraform"
    Terraform = true
    Env       = "DEV"
    Project   = "DevSecOps"
  }
}

variable "sg_name" {
  type    = string
  default = "tf_sg_all"
  # Optional to inform what is this variable about 
  description = "Security Group allowed all ports"
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  default = 0
}

variable "egress_to_port" {
  default = 0
}

variable "ingress_from_port" {
  default = 0
}

variable "ingress_to_port" {
  default = 0
}

variable "protocol" {
  default = "-1"
}

