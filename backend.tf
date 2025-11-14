terraform {
  backend "s3" {
    bucket = "aws-s3-bucket-1311"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

