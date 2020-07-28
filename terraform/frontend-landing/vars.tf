variable "s3_bucket_name" {
  type = string
}

variable "s3_bucket_tags" {
  type = map
}

variable "s3_bucket_acl" {
  type = string
}

variable "s3_bucket_origin_id" {
  type = string
}

variable "cf_distribution_tags" {
  type = map
}

variable "cf_distribution_price_class" {
  type = string
}

variable "cf_distribution_enabled" {
  type = bool
}

variable "cf_default_root_object" {
  type = string
}

variable "cf_aliases" {
  type = list
}

variable "cf_default_cache_behavior_allowed_methods" {
  type = list
}
variable "cf_default_cache_behavior_cached_methods" {
  type = list
}
variable "cf_default_cache_behavior_forwarded_values_query_string" {
  type = bool
}
variable "cf_default_cache_behavior_forwarded_values_cookies_forward" {
  type = string
}
variable "cf_default_cache_behavior_viewer_protocol_policy" {
  type = string
}

variable "cf_default_certificate" {
  type = bool
}

variable "cf_distribution_restriction_type" {
  type = string
}
