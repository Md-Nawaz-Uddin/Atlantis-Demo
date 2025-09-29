provider "aws" {
  region = var.region
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "aws_s3_bucket" "demo" {
  bucket = "atlantis-demo-bucket-${random_integer.suffix.result}"
  tags = {
    Name        = "atlantis-demo"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "extra-by-cli" {
  bucket = "atlantis-extra-bucket-cli${random_integer.suffix.result}"
}
