locals {
  bucket_config = yamldecode(file("${path.module}/../config/buckets.yaml"))

  buckets = {
    for bucket in local.bucket_config.buckets : bucket.bucket_name => {
      bucket_name       = bucket.bucket_name
      retention_days    = bucket.retention_days
      uploader_role_arn = bucket.uploader_role_arn
    }
  }
}
