terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "s3_bucket_comoestasui" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl
  tags   = var.s3_bucket_tags
}

resource "aws_cloudfront_distribution" "cf_distribution_comoestasui" {
  origin {
    domain_name = aws_s3_bucket.s3_bucket_comoestasui.bucket_regional_domain_name
    origin_id   = var.s3_bucket_origin_id
  }
  enabled             = var.cf_distribution_enabled
  default_root_object = var.cf_default_root_object
  aliases             = var.cf_aliases
  default_cache_behavior {
    allowed_methods  = var.cf_default_cache_behavior_allowed_methods
    cached_methods   = var.cf_default_cache_behavior_cached_methods
    target_origin_id = var.s3_bucket_origin_id
    forwarded_values {
      query_string = var.cf_default_cache_behavior_forwarded_values_query_string
      cookies {
        forward = var.cf_default_cache_behavior_forwarded_values_cookies_forward
      }
    }
    viewer_protocol_policy = var.cf_default_cache_behavior_viewer_protocol_policy
  }
  price_class = var.cf_distribution_price_class
  restrictions {
    geo_restriction {
      restriction_type = var.cf_distribution_restriction_type
    }
  }
  tags = var.cf_distribution_tags
  viewer_certificate {
    cloudfront_default_certificate = var.cf_default_certificate
  }
}
