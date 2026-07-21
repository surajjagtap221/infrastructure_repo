data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "security/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}

data "aws_caller_identity" "devsecops_admin" {}