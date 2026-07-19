aws_profile = "devsecops-admin"
aws_region  = "us-east-1"

environment = "dev"

node_group_name = "system_ng"

desired_size    = 2
min_size        = 2
max_size        = 3
max_unavailable = 1

capacity_type = "ON_DEMAND"

instance_type = ["c7i-flex.large"]

launch_template_version = "$Latest"

node_labels = {
  "workload"  = "system"
  environment = "dev"
  managed-by  = "terraform"
}