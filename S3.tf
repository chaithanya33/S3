
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "one" {
  bucket = "terraform.chaithu.one"
}

resource "aws_s3_bucket_versioning" "two" {
  bucket = aws_s3_bucket.one.id
  versioning_configuration  {
    status = "Enabled"
  }
}



# IAM POLICES CREATE USER S3 FULL PERMISSIONS FOR EC2 or else error regarding permissions

# for multiple buckets with different names at a time


resource "aws_s3_bucket" "os" {
  for_each = toset(var.abc)
  bucket = each.key
}

variable "abc" {
  default = ["jenkins.flm.bucket" , "docker.flm.bucket", "k8s.flm.bucket"] #diffrent bucket names
}
