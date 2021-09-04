terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }   
    }
    backend "s3" {
        bucket = "tf-7.4"
        key    = "7.4/key"
        region = "us-east-1"
    }
}