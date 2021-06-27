dependencies {
  paths = ["../"]
}

terraform {
  source = "git@github.com:seanw2020/modules.git//global/iam?ref=0.0.5"
}

include {
  path = find_in_parent_folders()
}
