variable "rds-subnet-ids" {
  type = list(string)
  description = "SubnetID where RDS will be created."
}

variable "db-instance-class" {
  default = "db.t3.micro"
}

variable "db-password" {
  default = ""
  description = "Database master user password"
}
