provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "1.7.1"
}

terraform {
  backend "s3" {
    bucket = "github-s3-example-tf-state"                #TODO: - you will need to create this bucket 
    key    = "s3_proxy_github_example/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "s3-proxy-gateway" {
  source      = "./s3-proxy-gateway"
  environment = "${var.environment}"
  region      = "${var.region}"
}

#TODO: - Add aaws.auto.tfvars


# access_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

