# ============================================================
## Import terraform module
# ============================================================

terraform {
  # Here you must indicate the full path to the Terraform module
  source = "../../terraform/frontend"
}

# ============================================================
## Import terraform module variables fron configuration file
# ============================================================

locals {
  frontend_vars        = read_terragrunt_config(find_in_parent_folders("frontend.hcl"))
  s3_bucket_tags       = local.frontend_vars.locals.s3_bucket_tags
  cf_distribution_tags = local.frontend_vars.locals.cf_distribution_tags
}


# ============================================================
## Include configuration file from root
# ============================================================

include {
  path = "${find_in_parent_folders()}"
}

# ============================================================
## Pass input variables to terraform module
# ============================================================

inputs = {
  s3_bucket_tags       = local.s3_bucket_tags
  cf_distribution_tags = local.cf_distribution_tags
}
