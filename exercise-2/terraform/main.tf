module "backup_bucket" {
  source = "git::https://github.com/benkorichard/terraform-aws-s3-bucket?ref=feat/init"

  for_each          = local.buckets

  bucket_name       = each.value.bucket_name
  retention_days    = each.value.retention_days
  uploader_role_arn = each.value.uploader_role_arn
}
