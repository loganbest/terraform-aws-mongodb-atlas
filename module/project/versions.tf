terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = ">= 1.15.0, < 1.18.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}
