variable "region" {
  type    = string
  default = "ap-northeast-3"
}

# variables.tf
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket. If left null, a dynamic name will be generated."
  default     = null
}
