terraform {
  backend "s3" {
    bucket  = "terraform-monitor-provide-states-files"
    key     = "logstash.tfstate"
    region  = "us-east-1"
  }
}