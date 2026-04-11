variable "name" {
  description = "Name of the application"
}

variable "vpc_cidr" {
  type = string
  default = "10.100.10.0/24"
}

variable "region" {
  type = string
  default = "eu-central-1"
}

variable "subnet_cidr_db" {
  type =  list(string)
  default = ["10.100.10.0/26","10.100.10.64/26"]
}
