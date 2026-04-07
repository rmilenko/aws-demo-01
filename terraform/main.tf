provider "aws" {
  region = "eu-central-1"
}

# data "aws_ami" "ubuntu" {
#   most_recent = true
#
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
#   }
#
#   owners = ["099720109477"] # Canonical
# }
#
# resource "aws_instance" "app_server" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"
#
#   tags = {
#     Name = "learn-terraform"
#   }
# }

module "ec2-instance-1" {
  source = "./modules/aws-ec2"
  instance_name = "instance-01"
  region = "eu-central-1"
}

module "ec2-instance-2" {
  source = "./modules/aws-ec2"
  instance_name = "instance-02"
  region = "eu-central-1"
}
