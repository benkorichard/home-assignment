terraform {
  backend "s3" {
    bucket = var.TFSTATE_BACKEND_BUCKET
    prefix = "exercise-1/terraform.tfstate"
  }
}
