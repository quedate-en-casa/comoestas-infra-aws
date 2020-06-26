# ============================================================
## Lee archivos de configuración y define variables locales
# ============================================================

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  aws_region   = local.account_vars.locals.aws_region
  aws_profile  = local.account_vars.locals.aws_profile
}

# ============================================================
## Configuración de provider AWS
# ============================================================

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
    region = "${local.aws_region}"
    profile = "${local.aws_profile}"
  }
EOF
}

# ============================================================
## Almacena estado de terraform en bucket S3
# ============================================================

remote_state {
  backend = "s3"
  config = {
    bucket         = "comoestas-ui-tfstate"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "comoestas-ui-tfstate-lock"
  }
}

# ============================================================
## Crea variables globales a partir de variables locales
# ============================================================

inputs = merge(local.account_vars.locals)
