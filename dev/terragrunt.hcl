locals {
  common_vars = yamldecode(file("common_vars.yaml"))
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = local.common_vars.bucket

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.common_vars.region
    encrypt        = true
    dynamodb_table = local.common_vars.dynamodb_table
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region         = "${local.common_vars.region}"
}
EOF
}
