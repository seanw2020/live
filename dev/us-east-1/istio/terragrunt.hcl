dependencies {
  paths = ["../prerequisites", "../eks"]
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

terraform {
  source = "git@github.com:seanw2020/modules.git//istio?ref=0.0.9"
}

# gets the s3 bucket info
include {
  path = find_in_parent_folders()
}

# override provider to use this role created by parent
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region         = "${local.common_vars.region}"
  assume_role {
  role_arn = "arn:aws:iam::${get_aws_account_id()}:role/terragrunt"
  }
}
EOF
}

inputs = {
  role_arn = "arn:aws:iam::${get_aws_account_id()}:role/terragrunt"
  cluster_name = "my-awesome-cluster2"
}
