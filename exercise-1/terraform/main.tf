module "vpc" {
	source = "git::https://github.com/benkorichard/terraform-aws-vpc?ref=feat/init"

    vpc_cidr = "10.0.0.0/16"
	name     = "exercise-1"

	public_subnet_cidrs = {
		"eu-central-1a" = "10.0.1.0/24"
		"eu-central-1b" = "10.0.2.0/24"
	}
	private_subnet_cidrs = {
		"eu-central-1a" = "10.0.11.0/24"
		"eu-central-1b" = "10.0.12.0/24"
	}
}
