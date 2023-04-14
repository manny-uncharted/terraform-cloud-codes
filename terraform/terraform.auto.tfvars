region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

tags = {
  Owner-Email     = "akanji.emmanuel.oluwaseun@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}

name = "ACS"

environment = "dev"

destination_cidr_block = "0.0.0.0/0"

ami-web = "ami-00a45107f7c3455a5"

ami-bastion = "ami-0dbc99375eba56ff4"

ami-nginx = "ami-010bd88cc8f5997f3"

ami-sonar = "ami-0f8bd95a744e074b8"

keypair = "terraform"

# Ensure to change this to your acccount number
account_no = "616656976295"

master-username = "manny"

master-password = "devopspbl"

### -------- ALB -------- ###
ip_address_type     = "ipv4"
load_balancer_type  = "application"
port                = 443
protocol            = "HTTPS"
company_name        = "ACS"
interval            = 10
path                = "/healthstatus"
timeout             = 5
healthy_threshold   = 5
unhealthy_threshold = 2
target_type         = "instance"
default_action_type = "forward"
priority            = 99