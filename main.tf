terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


import {
  to       = aws_instance.app1-dev
  provider = aws
  identity = {
    account_id = "405454589939"
    id         = "i-014254373450aa9c9"
    region     = "us-east-1"
  }
}


