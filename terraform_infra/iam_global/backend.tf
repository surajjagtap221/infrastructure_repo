terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "iam/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}