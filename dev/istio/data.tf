# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket  = "wingerts-tfstate-1709"
    region  = "us-east-1"
    key     = "./../eks/terraform.tfstate"
  }
}
