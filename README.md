# Usage

### Step 1.

Create an s3 bucket to manage your terraform state. Update the s3 bucket name located in terraform.tf file
from "your-s3-terraform-state-bucket-here" to the name of your bucket. See below:

```
terraform {
  backend "s3" {
    bucket = "your-s3-terraform-state-bucket-here"       # You need to change this to your bucket name
    key    = "s3_proxy_github_example/terraform.tfstate"
    region = "eu-west-1"
  }
}

```

### Step 2.

Create an aws.auto.tfvars file at the same level as terraform.tf file in the root s3-proxy directory.
Add your aws access_key and secret_key to this file. This should look like below:

```
access_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Step 3.

Create a directory called plan at the same level as terraform.tf file in the root s3-proxy directory.

### Step 4.

Run the commands below to initialize and build the s3 proxy

```
terraform init
terraform plan  '-out=plan/s3-proxy-gateway.plan' --target=module.s3-proxy-gateway
terraform apply "plan/s3-proxy-gateway.plan"
```

### Step 5. - Test PUT and GET in Postman

Method: PUT/GET
Uri: https://your-aws-gatwayuri/dev/file-upload-bucket-dev/myfolder/foo-bar.jpg
Request Headers

```
Content-Type : image/jpeg
x-api-key : xxxxxxxxxxxxxxxxxxxxx
```
