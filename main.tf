provider "aws" {
    region = "us-east-1"
}

//Ищем последний дистрибутив Ubuntu 20.04
data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]   // Canonical
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

//Описываем создание тестового сервера
resource "aws_instance" "netology_test" {
    ami = data.aws_ami.ubuntu.id   
    instance_type = "t3.micro"
    count = 0

    lifecycle {
        create_before_destroy = true
    }

    tags = {
        Name = "netology-test"
    }
}


