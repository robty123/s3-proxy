provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "1.7.1"
}

terraform {
  backend "s3" {
    bucket = "github-s3-example-tf-state"
    key    = "s3_proxy_github_example/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "s3-proxy-gateway" {
  source      = "./s3-proxy-gateway"
  environment = "${var.environment}"
  region      = "${var.region}"
}

# *************************** Usage *************************************************


# Step 1. - Create an s3 bucket called 'github-s3-example-tf-state' to manage your terraform state


# Step 2. - Create an aws.auto.tfvars file at the same level as terraform.tf file in the root directory.
#        - Add your aws access_key and secret_key to this file. This should look like below:
#
# access_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


# Step 3. - Run the commands below to initialize and build the s3 proxy
#
#  terraform init
#  terraform plan  '-out=plan/s3-proxy-gateway.plan' --target=module.s3-proxy-gateway
#  terraform apply "plan/s3-proxy-gateway.plan"


# Step 4. - Test in Postman

