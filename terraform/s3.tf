

resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = "my-example-solution-arch"
   

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}