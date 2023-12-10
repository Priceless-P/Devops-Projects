terraform {
  backend "s3" {
    bucket = "terraform-state-file-backend-prisca"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
