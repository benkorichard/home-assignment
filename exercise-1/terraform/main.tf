module "vpc" {
  source = "github.com/benkorichard/terraform-aws-vpc?ref=feat/init"

  for_each = local.vpcs

  vpc_cidr             = each.value.vpc_cidr
  name                 = each.value.name
  public_subnet_cidrs  = each.value.public_subnet_cidrs
  private_subnet_cidrs = each.value.private_subnet_cidrs
}
