terraform {
  # This module is now only being tested with Terraform 1.1.x. However, to make upgrading easier, we are setting 1.0.0 as the minimum version.
  required_version = ">= 0.15.5" #changed from 1.0.0
}

module "os" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:tnn-gruntwork-io/terraform-aws-utilities.git//modules/operating-system?ref=v1.0.8"
  source = "../../modules/operating-system"
}
