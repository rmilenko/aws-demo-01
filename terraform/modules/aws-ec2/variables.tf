variable "instance_name" {
  description = "EC2 Instance name"
  type = string
}

variable "region" {
  type = string
  description = "EC2 region (example: eu-central-1)"
  default = "eu-central-1"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}