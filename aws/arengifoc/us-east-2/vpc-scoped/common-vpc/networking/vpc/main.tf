module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "common-vpc"
  cidr = "10.90.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24"]
  public_subnets  = ["10.90.101.0/24", "10.90.102.0/24", "10.90.103.0/24"]

  # Deshabilitar NAT Gateway
  enable_nat_gateway = false
  enable_vpn_gateway = false

  # Habilitar DNS
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  tags = {
    Environment = "production"
    Terraform   = "true"
    ManagedBy   = "terraform"
  }

  public_subnet_tags = {
    Type = "public"
  }

  private_subnet_tags = {
    Type = "private"
  }
}
