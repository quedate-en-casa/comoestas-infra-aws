locals {
  s3_bucket_tags = {
    customer    = "comoestas"
    environment = "dev"
  }
  cf_distribution_tags = {
    customer    = "comoestas"
    environment = "dev"
  }
}
