dependencies {
  paths = ["../prerequisites"]
}

terraform {
  source = "git@github.com:seanw2020/modules.git//eks?ref=0.0.9"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  role_arn = "arn:aws:iam::${get_aws_account_id()}:role/terragrunt"
  cluster_name = "my-awesome-cluster2"
}
