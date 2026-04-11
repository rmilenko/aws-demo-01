provider "aws" {
  region = "eu-central-1"
}

module "network" {
  source = "./modules/aws-network"
  name   = "app-1"
  region = "eu-central-1"
}

module "ec2-instance-1" {
  depends_on    = [module.network]
  source        = "./modules/aws-ec2"
  for_each      = toset(data.aws_subnets.example.ids)
  instance_name = "instance-01-${each.value}"
  region        = "eu-central-1"
  subnet_id     = each.value
  vpc_id        = module.network.vpc_id
}

data "aws_vpc" "vpc" {
  id = module.network.vpc_id
}

data "aws_subnets" "example" {
  depends_on = [module.network]
  filter {
    name   = "vpc-id"
    values = [module.network.vpc_id]
  }
}

# locals {
#   subnet_map = {
#     for idx, id in data.aws_subnets.example.ids :
#     idx => id
#   }
# }
#
# data "aws_subnet" "example" {
#   depends_on = [data.aws_subnets.example]
#   for_each = local.subnet_map
#   id       = each.value
# }
# output "subnet_cidr_blocks" {
#   value = [for s in data.aws_subnet.example : s.cidr_block]
# }

output "subnets-ids" {
  # value = [for s in data.aws_subnets.example.ids : s.ids]
  value = data.aws_subnets.example.ids
}

output "data-aws-subnets-example" {
  value = data.aws_subnets.example
}

# output "data-aws-subnet-example" {
#   value = data.aws_subnet.example
# }