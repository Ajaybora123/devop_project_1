terraform {
  backend "s3" {
    bucket = "my-dev-tf-state-bucketss"
    key = "server_name/statefile"
    region = "us-east-2"
  }

}  
