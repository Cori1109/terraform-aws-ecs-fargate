provider "aws" {
  region = "us-west-2"
}

module "ecs_fargate" {
  source = "../.."

  security_groups = ["${module.sg.id}"]
  subnets         = ["${module.vpc.public_subnets}"]
  vpc_id          = "${module.vpc.vpc_id}"
  container_port  = "9999"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.40.0"

  name               = "dev"
  cidr               = "10.0.0.0/16"
  enable_nat_gateway = true

  azs            = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags {
    Environment = "dev"
  }
}

module "sg" {
  source  = "rms1000watt/easy-sg/aws"
  version = "0.1.0"

  vpc_id = "${module.vpc.vpc_id}"
}
