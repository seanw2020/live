remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = local.common.locals.bucket

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.common.locals.region
    encrypt        = true
    dynamodb_table = local.common.locals.dynamodb_table
  }
}
