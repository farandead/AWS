terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.26.0"
        }
    }
}

provider "aws" {
    # Configuration options
}

resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = "my-example-solution-arch"
   

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_object" "object" {
    bucket = aws_s3_bucket.my-s3-bucket.bucket
    key    = "example.txt"
    source = "example.txt"
    etag   = filemd5("example.txt")
}
yes