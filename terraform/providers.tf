#
# Provider Configuration
#

provider "aws" {
  region = var.aws_region
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state"
  versioning { 
    enabled = true
  }
 }
terraform {
  backend "s3" {
    bucket         = "terraform_state"
    key            = "global/s3/terraform.tfstate"
    region         = "${var.aws_region}"
  }
}


