terraform {
  # This module is now only being tested with Terraform 1.1.x. However, to make upgrading easier, we are setting 1.0.0 as the minimum version.
  required_version = ">= 0.15.5" #changed from 1.0.0

  # Updating the Terraform external provider to 2.3.0 caused an undocumented breaking change (as evidenced by
  # issues like https://github.com/hashicorp/terraform-provider-external/issues/193). The solution is to pin 
  # the version to a working version for now. 
  # Special thanks to Lorelei Rupp for reporting and discovering the root cause of this issue!
  # TODO: Once the issue is fixed. Update the version constraint to the latest non-breaking version.
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "= 2.2.3"
    }
  }
}

data "external" "required_executable" {
  program = ["python3", "${path.module}/require_executable.py"]

  # Currently the external data source provider does not support list values in the query, so we convert the input list
  # to be a comma separated string.
  # See https://github.com/terraform-providers/terraform-provider-external/issues/2
  query = {
    required_executables = join(",", var.required_executables)
    error_message        = var.error_message
  }
}
