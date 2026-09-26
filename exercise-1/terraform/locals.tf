locals {
	vpc_config = yamldecode(file("${path.module}/../config/vpc.yaml"))

	vpcs = {
		for vpc in local.vpc_config.vpcs : vpc.name => {
			name       = vpc.name
			vpc_cidr   = vpc.cidr_block
			public_subnet_cidrs = {
				for subnet in vpc.subnets : subnet.az => subnet.cidr_block
				if subnet.type == "public"
			}
			private_subnet_cidrs = {
				for subnet in vpc.subnets : subnet.az => subnet.cidr_block
				if subnet.type == "private"
			}
		}
	}
}
