# why auto complete not work

resource "aws_instance" "app_server" {
  ami = var.ami
  instance_type = var.instance_type
  
}

variable "ami" {
  type = string
  description = "holds ami"
}

variable "app_region" {
    type = string
    default = "eu-central-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

resource "aws_security_group" "ec2-sec" {
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    # cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }
}