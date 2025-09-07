terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mybuckettfstatekonecta"   # YOU create this
    key            = "envs/demo/terraform.tfstate"     # path inside bucket
    region         = "eu-central-1" 
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}



resource "aws_s3_bucket" "demo" {
  bucket        = "konecta-teat-demo-cicd"
  force_destroy = true
  tags = { Project = "jenkins-class" }
}
