terraform {
  required_version = ">1.11.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~1.5.1"
    }
  }
}