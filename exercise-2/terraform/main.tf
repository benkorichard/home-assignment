module "backup_bucket" {
	source = "git::https://github.com/benkorichard/terraform-aws-s3-bucket?ref=feat/init"

	bucket_name = "exercise-2"
	retention_days     = 180
	uploader_role_arn  = "arn:aws:iam::123456789012:role/backup_uploader"
}
