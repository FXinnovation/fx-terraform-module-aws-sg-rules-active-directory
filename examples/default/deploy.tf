#####
# Provider
#####

provider "aws" {
  version    = ">= 2"
  region     = "ca-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#####
# Datasources
#####

data "aws_vpc" "default" {
  default = true
}

#####
# Randoms
#####

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
  number  = false
}

#####
# Context
#####

resource "aws_security_group" "this" {
  name   = format("this-%s", random_string.this.result)
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "ad" {
  name   = format("ad-%s", random_string.this.result)
  vpc_id = data.aws_vpc.default.id
}

#####
# Module
#####

module "this" {
  source = "../../"

  active_directory_cidrs              = ["10.0.0.0/24"]
  active_directory_security_group_ids = [aws_security_group.ad.id]
  security_group_id                   = aws_security_group.this.id
}
