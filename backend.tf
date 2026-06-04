terraform {
  backend "s3" {
    bucket       = "my-bucket-908835050269-ap-northeast-3-an"
    key          = "terraform.tfstate"
    region       = "ap-northeast-3"
    encrypt      = true
    use_lockfile = true
  }
}
