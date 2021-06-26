terraform {
  source "git::https://github.com/seanw2020/modules.git//eks?ref=0.0.2"
}

include {
  path = find_in_parent_folders()
}
