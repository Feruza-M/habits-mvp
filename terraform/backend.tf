terraform {
  backend "s3" {
    bucket = "feruza-habits-tfstate-2026"
    key    = "habits-mvp/terraform.tfstate"
    region = "us-east-1"
  }
}
