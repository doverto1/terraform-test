# main.tf

terraform {
  backend "local" {}
}

locals {
  #users with read + write access
  admins = {
    gary  = "gary@gmail.com"
    wendy = "wendy@gmail.com"

  }

  #users with read only access
  users = {
    bill  = "bill@gmail.com"
    jenny = "jenny@gmail.com"
  }
}

# user the local_file terraform resource to output our users to a json file

resource "local_file" "user_data" {
  content  = jsonencode({ admins = local.admins, users = local.users })
  filename = "${path.module}/user_data.json" #basically a ./user_data.json
}
