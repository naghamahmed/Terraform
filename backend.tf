terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-tf"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
