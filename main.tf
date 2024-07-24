terraform {
  required_version = ">=1.3.0"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    bucket = "aline886e3f588"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      owner      = "AlineTeles"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "le-vpc" {
  backend = "s3"
  config = {
    bucket = "aline886e3f588"
    key    = "aws-vpc/terraform.tfstate" #diretorio da bucket que guarda o state
    region = "us-east-2"                 #Ohio
  }
}

