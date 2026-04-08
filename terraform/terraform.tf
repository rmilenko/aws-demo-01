terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
    # terraform = {
    #   source  = "builtin/terraform"
    #   version = ""
    # }
  }

  required_version = ">= 1.2"
}
