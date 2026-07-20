## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\README.md

```md
# infrastructure_repo
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\backend.tf

```tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\main.tf

```tf
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\output.tf

```tf
output "terraform_state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}
output "terraform_lock_table" {
  value = aws_dynamodb_table.terraform_lock.name
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\provider.tf

```tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\variables.tf

```tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "dynamodb_table" {
  type = string
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\versions.tf

```tf
terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\code.md

```md
## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\README.md

`md
# infrastructure_repo
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\main.tf

`tf
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\output.tf

`tf
output "terraform_state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}
output "terraform_lock_table" {
  value = aws_dynamodb_table.terraform_lock.name
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\provider.tf

`tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\variables.tf

`tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "dynamodb_table" {
  type = string
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\versions.tf

`tf
terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\code.md

`md
## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\README.md

`md
# infrastructure_repo
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\main.tf

`tf
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\output.tf

`tf
output "terraform_state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}
output "terraform_lock_table" {
  value = aws_dynamodb_table.terraform_lock.name
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\provider.tf

`tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\variables.tf

`tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "dynamodb_table" {
  type = string
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\backend\versions.tf

`tf
terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
`


`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\cluster.tf

`tf
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${var.environment}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  vpc_config {
    subnet_ids = local.network.private_app_subnet_ids

    security_group_ids = [
      local.security.eks_cluster_sg_id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-cluster"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\data.tf

`tf
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "security/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_cluster_role.tf

`tf
data "aws_iam_policy_document" "eks_cluster_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-eks-cluster-role"

  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role.json

  tags = merge (
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-cluster-role"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_node_role.tf

`tf
data "aws_iam_policy_document" "eks_node_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_node_role" {
  name = "${var.project_name}-eks-node-role"

  assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-node-role"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_policy_attachments.tf

`tf
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\launch_template.tf

`tf
resource "aws_launch_template" "eks_node_template" {
  name_prefix = "${var.project_name}-eks-node-template"

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 30
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  vpc_security_group_ids = [ local.security.eks_node_sg_id ]

  monitoring {
    enabled = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-eks-worker-node"
      }
    )
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-eks-wroker-volume"
      }
    )
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-launch-tamplate"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\locals.tf

`tf
locals {

  network = {
    vpc_id                 = data.terraform_remote_state.network.outputs.vpc_id
    private_app_subnet_ids = data.terraform_remote_state.network.outputs.private_app_subnet_ids
  }

  security = {
    eks_cluster_sg_id = data.terraform_remote_state.security.outputs.eks_cluster_sg_id
    eks_node_sg_id    = data.terraform_remote_state.security.outputs.eks_node_sg_id
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\node_group.tf

`tf
resource "aws_eks_node_group" "system" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-${var.node_group_name}"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = local.network.private_app_subnet_ids

  capacity_type = var.capacity_type

  instance_types = var.instance_type

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  launch_template {
    id      = aws_launch_template.eks_node_template.id
    version = var.launch_template_version
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  labels = var.node_labels

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.node_group_name}"
    }
  )

  lifecycle {
    create_before_destroy = false
  }

  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only,
    aws_iam_role_policy_attachment.eks_node_policy
  ]

}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\oidc.tf

`tf

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\outputs.tf

`tf

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\provider.tf

`tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\readme.md

`md
# Configure kubectl Access to the Amazon EKS Cluster

After successfully provisioning the Amazon EKS Control Plane using Terraform, configure your local Kubernetes client (`kubectl`) to communicate with the cluster.

## Update kubeconfig

Run the following command:

```bash
aws eks update-kubeconfig \
  --region us-east-1 \
  --name enterprise-devsecops-dev-cluster \
  --profile devsecops-admin
```

This command updates your local Kubernetes configuration (`~/.kube/config`) with the following information:

- EKS Cluster Endpoint
- Cluster Certificate Authority (CA)
- Authentication Configuration
- Cluster Context

No AWS resources are created or modified. The command only updates your local machine's Kubernetes configuration.

---

## Verify Cluster Connectivity

Verify that `kubectl` can communicate with the EKS Control Plane.

```bash
kubectl cluster-info
```

Expected output:

```
Kubernetes control plane is running at https://<cluster-endpoint>
CoreDNS service is running...
```

---

## Verify Worker Nodes

Check whether worker nodes have joined the cluster.

```bash
kubectl get nodes
```

### Expected Output

Before creating the Managed Node Group:

```text
No resources found
```

After creating the Managed Node Group:

```text
NAME                             STATUS   ROLES    AGE   VERSION
ip-10-0-11-xxx.ec2.internal      Ready    <none>   ...   ...
ip-10-0-12-xxx.ec2.internal      Ready    <none>   ...   ...
```

---

## Why This Step is Required

The Kubernetes CLI (`kubectl`) requires connection information before it can communicate with an Amazon EKS cluster.

The `aws eks update-kubeconfig` command retrieves the cluster details from AWS and stores them in the local kubeconfig file, enabling secure authentication using your AWS IAM credentials.

Without this step, commands such as:

```bash
kubectl get nodes
kubectl get pods
kubectl get namespaces
kubectl get services
```

will fail because `kubectl` does not know which Kubernetes cluster to connect to.

---

## Prerequisites

Ensure the following are installed and configured:

- AWS CLI v2
- kubectl
- Valid AWS CLI profile (`devsecops-admin`)
- Amazon EKS Cluster in the `ACTIVE` state

---

## Validate the Cluster Status

```bash
aws eks describe-cluster \
  --name enterprise-devsecops-dev-cluster \
  --region us-east-1 \
  --profile devsecops-admin \
  --query "cluster.status"
```

Expected output:

```text
"ACTIVE"
```


# Amazon EC2 Launch Template

This Launch Template defines the configuration for Amazon EKS worker nodes. It provides a reusable blueprint that AWS uses whenever a new worker node is launched or replaced.

## Features

- 30 GiB encrypted **gp3** root volume
- IMDSv2 enforced for enhanced security
- Detailed CloudWatch monitoring enabled
- Automatic deletion of EBS volume on instance termination
- Standardized resource tagging
- Automatic update to the latest launch template version

## Why Use a Launch Template?

Using a Launch Template ensures that all EKS worker nodes are launched with consistent, secure, and production-ready configurations while allowing future customization without modifying the Managed Node Group.



`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\variables.tf

`tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}

variable "kubernetes_version" {
  type    = string
  default = "1.33"
}

variable "node_labels" {
  description = "K8s labels applyed to all worker nodes"
  type        = map(string)

  default = {
    "workload"    = "system"
    "environment" = "dev"
    "managed-by"  = "Terraform"
  }
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "system-ng"
}
variable "desired_size" {
  type    = number
  default = 2
}
variable "min_size" {
  type    = number
  default = 2
}
variable "max_size" {
  type    = number
  default = 3
}
variable "max_unavailable" {
  type    = number
  default = 1
}
variable "capacity_type" {
  description = "EKS node group capacity type"
  type        = string
  default     = "ON_DEMAND"
}
variable "instance_type" {
  description = "EKS node group instance type"
  type        = list(string)
  default     = ["c7i-flex.large"]
}

variable "launch_template_version" {
  description = "Launch Template version used by EKS Managed Node Group"
  type        = string
  default     = "$Latest"
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\versions.tf

`tf
terraform {
  required_version = ">=1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\igw.tf

`tf
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-igw"
    }
  )
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\nat.tf

`tf
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-eip"
  }
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnets[0].id

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-gateway"
  }
)
  depends_on = [aws_internet_gateway.igw]
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\output.tf

`tf
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}
output "private_app_subnet_ids" {
  value = aws_subnet.private_app_subnets[*].id
}
output "private_db_subnet_ids" {
  value = aws_subnet.private_db_subnets[*].id
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\provider.tf

`tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = {
      Project     = "Enterprise-DevSecOps"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\readme.md

`md
# AWS Three-Tier VPC Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-VPC-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)

## Overview

This Terraform project provisions a production-style AWS networking infrastructure following a three-tier architecture.

The infrastructure consists of:

- Custom VPC
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Route Tables
- Route Table Associations

---

# Architecture

```text
                        Internet
                            │
                    Internet Gateway
                            │
                    ┌──────────────┐
                    │     VPC      │
                    │10.0.0.0/16   │
                    └──────────────┘
                            │
        ┌───────────────────┼────────────────────┐
        │                   │                    │
 Public Subnet AZ1    Public Subnet AZ2   Public Subnet AZ3
   10.0.1.0/24         10.0.2.0/24        10.0.3.0/24
        │                   │                    │
        └──────────────┬────┴──────────────┘
                       │
                  NAT Gateway
                       │
       ┌───────────────┴────────────────┐
       │                                │
Private App Subnets             Private DB Subnets
10.0.11.0/24                    10.0.21.0/24
10.0.12.0/24                    10.0.22.0/24
10.0.13.0/24                    10.0.23.0/24
```

---

# Infrastructure Components

## VPC

| Property | Value |
|----------|-------|
| CIDR | 10.0.0.0/16 |
| DNS Hostnames | Enabled |
| DNS Support | Enabled |

---

## Public Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.1.0/24 |
| us-east-1b | 10.0.2.0/24 |
| us-east-1c | 10.0.3.0/24 |

Features

- Auto Assign Public IP
- Internet Access
- ELB Ready

---

## Private Application Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.11.0/24 |
| us-east-1b | 10.0.12.0/24 |
| us-east-1c | 10.0.13.0/24 |

Features

- No Public IP
- Internet access through NAT Gateway
- Internal Load Balancer Ready

---

## Private Database Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.21.0/24 |
| us-east-1b | 10.0.22.0/24 |
| us-east-1c | 10.0.23.0/24 |

Features

- Fully Isolated
- No Internet Access
- Suitable for RDS

---

# Networking Components

## Internet Gateway

Provides internet connectivity to public subnets.

---

## NAT Gateway

Located in the first public subnet.

Purpose:

- Allows outbound internet traffic
- Keeps private instances inaccessible from internet

---

## Route Tables

### Public Route Table

```
0.0.0.0/0
     │
Internet Gateway
```

Associated with:

- Public Subnet 1
- Public Subnet 2
- Public Subnet 3

---

### Private App Route Table

```
0.0.0.0/0
      │
 NAT Gateway
```

Associated with:

- Private App Subnet 1
- Private App Subnet 2
- Private App Subnet 3

---

### Private DB Route Table

No Internet Route

Used for isolated database subnets.

---

# Resource Flow

```text
Internet
    │
Internet Gateway
    │
Public Route Table
    │
Public Subnets
    │
NAT Gateway
    │
Private App Route Table
    │
Private App Subnets
    │
Application
    │
Private DB Route Table
    │
Database Subnets
```

---

# Outputs

Terraform exports:

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private App Subnet IDs
- Private DB Subnet IDs

---

# High Availability

✔ Multi Availability Zone Deployment

- us-east-1a
- us-east-1b
- us-east-1c

---

# Security Design

Public Layer

- Internet Accessible
- Load Balancers
- NAT Gateway

Application Layer

- Private
- No Public IP
- Internet through NAT

Database Layer

- Completely Private
- No Internet Route

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Project Structure

```text
terraform-vpc/
│
├── backend.tf          # Terraform backend configuration
├── provider.tf         # AWS provider configuration
├── versions.tf         # Terraform & provider version constraints
├── variables.tf        # Input variable definitions
├── terraform.tfvars    # Variable values
├── outputs.tf          # Terraform outputs
│
├── vpc.tf              # Creates the VPC and configures DNS settings
├── tags.tf             # Common resource tags
├── subnet.tf           # Public, private application, and private database subnets
├── igw.tf              # Internet Gateway
├── nat.tf              # Elastic IP and NAT Gateway
├── route_table.tf      # Route tables and subnet associations
│
└── README.md           # Project documentation
```

## File Description

| File | Purpose |
|------|---------|
| `backend.tf` | Configures the Terraform backend for state management. |
| `provider.tf` | Configures the AWS provider and AWS region. |
| `versions.tf` | Defines the required Terraform and AWS provider versions. |
| `variables.tf` | Declares all input variables used in the project. |
| `terraform.tfvars` | Stores values for the declared variables. |
| `outputs.tf` | Exports useful resource IDs and attributes. |
| `vpc.tf` | Creates the AWS VPC and enables DNS support and DNS hostnames. |
| `tags.tf` | Defines common tags applied to all AWS resources. |
| `subnet.tf` | Creates public, private application, and private database subnets across multiple Availability Zones. |
| `igw.tf` | Creates and attaches the Internet Gateway to the VPC. |
| `nat.tf` | Creates an Elastic IP and NAT Gateway for outbound internet access from private subnets. |
| `route_table.tf` | Creates public/private route tables and associates them with the appropriate subnets. |
| `README.md` | Project documentation, architecture diagrams, deployment instructions, and project overview. |

---

# Best Practices

- Infrastructure as Code
- Multi-AZ Architecture
- Isolated Database Layer
- NAT Gateway for Private Resources
- Separate Route Tables
- Tagged Resources
- Scalable Design

---

# Future Improvements

- Bastion Host
- AWS ALB
- Auto Scaling Group
- ECS/EKS
- RDS
- VPC Endpoints
- CloudWatch
- AWS WAF
- Transit Gateway
- Terraform Modules

---

## License

MIT License
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\route_table.tf

`tf
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "public-route-table"
    }
  )
}

resource "aws_route_table" "private_app_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "private-app-route-table"
    }
  )
}

resource "aws_route_table" "private_db_RT" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "public_association" {
  count = 3

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "private_app_association" {
  count = 3

  subnet_id      = aws_subnet.private_app_subnets[count.index].id
  route_table_id = aws_route_table.private_app_RT.id
}

resource "aws_route_table_association" "private_db_association" {
  count = 3

  subnet_id      = aws_subnet.private_db_subnets[count.index].id
  route_table_id = aws_route_table.private_db_RT.id
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\subnet.tf

`tf
resource "aws_subnet" "public_subnets" {
  count = 3

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {

      Name = "public-subnet-${count.index + 1}"

      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "private_app_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_app_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-app-subnet-${count.index + 1}"

      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}

# Database subnets remain isolated and intentionally have no default internet route.
resource "aws_subnet" "private_db_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_db_subnets_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-db-subnet-${count.index + 1}"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\tags.tf

`tf
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\terraform.tf

`tf

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\variables.tf

`tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}

variable "availability_zones" {
  type = list(string)

  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "public_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "private_app_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]
}

variable "private_db_subnets_cidrs" {
  type = list(string)

  default = [
    "10.0.21.0/24",
    "10.0.22.0/24",
    "10.0.23.0/24"
  ]
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\versions.tf

`tf
terraform {
  required_version = ">=1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\vpc.tf

`tf
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-vpc"
    }
  )
}

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\clean_old_amis.sh

`sh

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\cleanup_launch_template_versions.sh

`sh

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\lifecycle_policies.md

`md

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "platform/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\alb_public_sg.tf

`tf
resource "aws_security_group" "alb_public" {
  name        = "${var.project_name}-alb-public-sg"
  description = "Security Group for the Public Application Load Balancer"
  vpc_id      = local.network.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-alb-public-sg"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\application_sg.tf

`tf

`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\backend.tf

`tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "security/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\data.tf

`tf
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\database_sg.tf

`tf
resource "aws_security_group" "database_sg" {
  name        = "${var.project_name}-database-sg"
  description = "Security Group for RDS Database"
  vpc_id      = local.network.vpc_id

  ingress {
    description     = "Allow MySQL traffic from EKS Worker Nodes"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_node.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-database-sg"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\eks_cluster_sg.tf

`tf
resource "aws_security_group" "eks_cluster" {
  name        = "${var.project_name}-eks-cluster-sg"
  description = "Security Group for Amazon EKS Control Plane"
  vpc_id      = local.network.vpc_id
  ingress {
    description = "Allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-eks-cluster-sg"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\eks_node_sg.tf

`tf
resource "aws_security_group" "eks_node" {
  name        = "${var.project_name}-eks-node-sg"
  description = "Security Group for EKS Managed Worker Nodes"
  vpc_id      = local.network.vpc_id

  ingress {
    description = "Allow worker node to worker node communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description     = "Allow control plane to communicate with worker nodes"
    from_port       = 1025
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_cluster.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-node-sg"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\locals.tf

`tf
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
locals {
  network = data.terraform_remote_state.network.outputs
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\nacls.tf

`tf
# NACLs for public subnets
resource "aws_network_acl" "public_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.public_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-nacl"
    }
  )
}

# NACLs for private app subnets
resource "aws_network_acl" "private_app_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_app_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}${var.environment}-private-app-nacl"
    }
  )
}

# NACLs for private db subnets
resource "aws_network_acl" "private_db_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_db_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-db-nacl"
    }
  )
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\outputs.tf

`tf
output "eks_node_sg_id" {
  value = aws_security_group.eks_node.id
}
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster.id
}
output "database_sg_id" {
  value = aws_security_group.database_sg.id
}
output "alb_public_sg_id" {
  value = aws_security_group.alb_public.id
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\provider.tf

`tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\readme.md

`md
# AWS Security Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-Security-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)
![License](https://img.shields.io/badge/License-MIT-success)

---

# Overview

This Terraform project provisions the **Security Layer** for a three-tier AWS infrastructure.

It creates security components for:

- Public Application Load Balancer
- Amazon EKS Control Plane
- Amazon EKS Worker Nodes
- Amazon RDS Database
- Public Network ACL
- Private Application Network ACL
- Private Database Network ACL

The project consumes the **Network Module** using Terraform Remote State to retrieve the existing VPC and subnet information.

---

# Architecture

```text
                    Internet
                        │
                Public Network ACL
                        │
                ALB Security Group
                        │
                 Public Subnets
                        │
         ─────────────────────────────────
                        │
          Private App Network ACL
                        │
          EKS Worker Node Security Group
                        │
                EKS Cluster SG
                        │
         ─────────────────────────────────
                        │
          Private DB Network ACL
                        │
            Database Security Group
                        │
                   Amazon RDS
```

---

# Security Architecture

```text
                +----------------------+
                |      Internet        |
                +----------+-----------+
                           |
                           |
              +------------v------------+
              |   Public Security SG    |
              |     ALB (80,443)        |
              +------------+------------+
                           |
                    Public Subnets
                           |
              +------------v------------+
              |      EKS Worker SG      |
              +------------+------------+
                           |
              +------------v------------+
              |    EKS Cluster SG       |
              +------------+------------+
                           |
              +------------v------------+
              |      Database SG        |
              |      MySQL 3306         |
              +-------------------------+
```

---

# Components

## Network ACLs

### Public NACL

Allows

- HTTP (80)
- HTTPS (443)
- Ephemeral Ports (1024-65535)

Outbound

- All traffic

---

### Private Application NACL

Allows

- Internal VPC Communication

Outbound

- Internet via NAT

---

### Private Database NACL

Allows

- MySQL (3306)
- Ephemeral Ports
- Internal VPC Communication

Outbound

- Internal VPC Communication

---

# Security Groups

## Application Load Balancer Security Group

### Inbound

| Port | Protocol | Source |
|-------|----------|--------|
|80|TCP|0.0.0.0/0|
|443|TCP|0.0.0.0/0|

Outbound

- All Traffic

---

## Amazon EKS Cluster Security Group

### Inbound

No inbound rules by default.

Outbound

- All Traffic

---

## Amazon EKS Worker Node Security Group

### Inbound

- Worker Node to Worker Node Communication

Outbound

- All Traffic

---

## Database Security Group

### Inbound

| Port | Source |
|-------|---------|
|3306|EKS Worker Node Security Group|

Outbound

- All Traffic

---

# Resource Relationship

```text
Internet
    │
    ▼
ALB Security Group
    │
    ▼
Public Subnets
    │
    ▼
EKS Worker Nodes
    │
    ▼
Database Security Group
    │
    ▼
Amazon RDS
```

---

# Terraform Remote State

This project retrieves networking resources from the Network Module.

Remote outputs include

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private Application Subnet IDs
- Private Database Subnet IDs

---

# Outputs

Terraform exports

| Output | Description |
|----------|-------------|
| alb_public_sg_id | Public ALB Security Group |
| eks_cluster_sg_id | EKS Cluster Security Group |
| eks_node_sg_id | EKS Worker Node Security Group |
| database_sg_id | Database Security Group |

---

```text
terraform-security/
│
├── backend.tf              # Remote backend configuration
├── provider.tf             # AWS provider configuration
├── versions.tf             # Terraform and provider version constraints
├── variables.tf            # Input variable declarations
├── terraform.tfvars        # Variable values
├── outputs.tf              # Exported resource outputs
│
├── data.tf                 # Terraform remote state and data sources
├── locals.tf               # Local values and reusable expressions
├── tags.tf                 # Common tags for all resources
│
├── nacls.tf                # Public, Private App, and Private DB Network ACLs
├── alb_public_sg.tf        # Public Application Load Balancer Security Group
├── eks_cluster_sg.tf       # Amazon EKS Control Plane Security Group
├── eks_node_sg.tf          # Amazon EKS Worker Node Security Group
├── database_sg.tf          # Amazon RDS Database Security Group
│
└── README.md               # Project documentation
```

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Deploy

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Security Design

✔ Layered Security

✔ Least Privilege Access

✔ Separate Network ACLs

✔ Dedicated Security Groups

✔ Database Isolation

✔ Internal Communication Restricted

✔ Multi-AZ Ready

✔ Terraform Remote State Integration

---

# Best Practices

- Infrastructure as Code (IaC)
- Modular Terraform Design
- Remote State Management
- Reusable Security Groups
- Network Segmentation
- Principle of Least Privilege
- Multi-tier Security Architecture
- Environment Tagging

---

# Future Enhancements

- AWS WAF
- AWS Shield
- Security Hub
- GuardDuty
- IAM Roles for Service Accounts (IRSA)
- VPC Endpoints
- Secrets Manager Integration
- ACM Certificates
- AWS Network Firewall

---

## License

MIT License
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\variables.tf

`tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}
`

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\versions.tf

`tf
terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
`


```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\backend.tf

```tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\cluster.tf

```tf
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${var.environment}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  vpc_config {
    subnet_ids = local.network.private_app_subnet_ids

    security_group_ids = [
      local.security.eks_cluster_sg_id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-cluster"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\data.tf

```tf
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "security/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_cluster_role.tf

```tf
data "aws_iam_policy_document" "eks_cluster_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-eks-cluster-role"

  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role.json

  tags = merge (
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-cluster-role"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_node_role.tf

```tf
data "aws_iam_policy_document" "eks_node_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_node_role" {
  name = "${var.project_name}-eks-node-role"

  assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-node-role"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\iam_policy_attachments.tf

```tf
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\launch_template.tf

```tf
resource "aws_launch_template" "eks_node_template" {
  name_prefix = "${var.project_name}-eks-node-template"

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 30
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  vpc_security_group_ids = [ local.security.eks_node_sg_id ]

  monitoring {
    enabled = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-eks-worker-node"
      }
    )
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
        Name = "${var.project_name}-${var.environment}-eks-wroker-volume"
      }
    )
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-launch-tamplate"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\locals.tf

```tf
locals {

  network = {
    vpc_id                 = data.terraform_remote_state.network.outputs.vpc_id
    private_app_subnet_ids = data.terraform_remote_state.network.outputs.private_app_subnet_ids
  }

  security = {
    eks_cluster_sg_id = data.terraform_remote_state.security.outputs.eks_cluster_sg_id
    eks_node_sg_id    = data.terraform_remote_state.security.outputs.eks_node_sg_id
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\node_group.tf

```tf
resource "aws_eks_node_group" "system" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-${var.node_group_name}"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = local.network.private_app_subnet_ids

  capacity_type = var.capacity_type

  instance_types = var.instance_type

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  launch_template {
    id      = aws_launch_template.eks_node_template.id
    version = var.launch_template_version
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  labels = var.node_labels

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.node_group_name}"
    }
  )

  lifecycle {
    create_before_destroy = false
  }

  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only,
    aws_iam_role_policy_attachment.eks_node_policy
  ]

}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\oidc.tf

```tf

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\outputs.tf

```tf

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\provider.tf

```tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\readme.md

```md
# Configure kubectl Access to the Amazon EKS Cluster

After successfully provisioning the Amazon EKS Control Plane using Terraform, configure your local Kubernetes client (`kubectl`) to communicate with the cluster.

## Update kubeconfig

Run the following command:

```bash
aws eks update-kubeconfig \
  --region us-east-1 \
  --name enterprise-devsecops-dev-cluster \
  --profile devsecops-admin
```

This command updates your local Kubernetes configuration (`~/.kube/config`) with the following information:

- EKS Cluster Endpoint
- Cluster Certificate Authority (CA)
- Authentication Configuration
- Cluster Context

No AWS resources are created or modified. The command only updates your local machine's Kubernetes configuration.

---

## Verify Cluster Connectivity

Verify that `kubectl` can communicate with the EKS Control Plane.

```bash
kubectl cluster-info
```

Expected output:

```
Kubernetes control plane is running at https://<cluster-endpoint>
CoreDNS service is running...
```

---

## Verify Worker Nodes

Check whether worker nodes have joined the cluster.

```bash
kubectl get nodes
```

### Expected Output

Before creating the Managed Node Group:

```text
No resources found
```

After creating the Managed Node Group:

```text
NAME                             STATUS   ROLES    AGE   VERSION
ip-10-0-11-xxx.ec2.internal      Ready    <none>   ...   ...
ip-10-0-12-xxx.ec2.internal      Ready    <none>   ...   ...
```

---

## Why This Step is Required

The Kubernetes CLI (`kubectl`) requires connection information before it can communicate with an Amazon EKS cluster.

The `aws eks update-kubeconfig` command retrieves the cluster details from AWS and stores them in the local kubeconfig file, enabling secure authentication using your AWS IAM credentials.

Without this step, commands such as:

```bash
kubectl get nodes
kubectl get pods
kubectl get namespaces
kubectl get services
```

will fail because `kubectl` does not know which Kubernetes cluster to connect to.

---

## Prerequisites

Ensure the following are installed and configured:

- AWS CLI v2
- kubectl
- Valid AWS CLI profile (`devsecops-admin`)
- Amazon EKS Cluster in the `ACTIVE` state

---

## Validate the Cluster Status

```bash
aws eks describe-cluster \
  --name enterprise-devsecops-dev-cluster \
  --region us-east-1 \
  --profile devsecops-admin \
  --query "cluster.status"
```

Expected output:

```text
"ACTIVE"
```


# Amazon EC2 Launch Template

This Launch Template defines the configuration for Amazon EKS worker nodes. It provides a reusable blueprint that AWS uses whenever a new worker node is launched or replaced.

## Features

- 30 GiB encrypted **gp3** root volume
- IMDSv2 enforced for enhanced security
- Detailed CloudWatch monitoring enabled
- Automatic deletion of EBS volume on instance termination
- Standardized resource tagging
- Automatic update to the latest launch template version

## Why Use a Launch Template?

Using a Launch Template ensures that all EKS worker nodes are launched with consistent, secure, and production-ready configurations while allowing future customization without modifying the Managed Node Group.



```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\variables.tf

```tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}

variable "kubernetes_version" {
  type    = string
  default = "1.33"
}

variable "node_labels" {
  description = "K8s labels applyed to all worker nodes"
  type        = map(string)

  default = {
    "workload"    = "system"
    "environment" = "dev"
    "managed-by"  = "Terraform"
  }
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "system-ng"
}
variable "desired_size" {
  type    = number
  default = 2
}
variable "min_size" {
  type    = number
  default = 2
}
variable "max_size" {
  type    = number
  default = 3
}
variable "max_unavailable" {
  type    = number
  default = 1
}
variable "capacity_type" {
  description = "EKS node group capacity type"
  type        = string
  default     = "ON_DEMAND"
}
variable "instance_type" {
  description = "EKS node group instance type"
  type        = list(string)
  default     = ["c7i-flex.large"]
}

variable "launch_template_version" {
  description = "Launch Template version used by EKS Managed Node Group"
  type        = string
  default     = "$Latest"
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\eks\versions.tf

```tf
terraform {
  required_version = ">=1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\backend.tf

```tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\igw.tf

```tf
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-igw"
    }
  )
}

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\nat.tf

```tf
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-eip"
  }
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnets[0].id

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-gateway"
  }
)
  depends_on = [aws_internet_gateway.igw]
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\output.tf

```tf
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}
output "private_app_subnet_ids" {
  value = aws_subnet.private_app_subnets[*].id
}
output "private_db_subnet_ids" {
  value = aws_subnet.private_db_subnets[*].id
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\provider.tf

```tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = {
      Project     = "Enterprise-DevSecOps"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\readme.md

```md
# AWS Three-Tier VPC Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-VPC-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)

## Overview

This Terraform project provisions a production-style AWS networking infrastructure following a three-tier architecture.

The infrastructure consists of:

- Custom VPC
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Route Tables
- Route Table Associations

---

# Architecture

```text
                        Internet
                            │
                    Internet Gateway
                            │
                    ┌──────────────┐
                    │     VPC      │
                    │10.0.0.0/16   │
                    └──────────────┘
                            │
        ┌───────────────────┼────────────────────┐
        │                   │                    │
 Public Subnet AZ1    Public Subnet AZ2   Public Subnet AZ3
   10.0.1.0/24         10.0.2.0/24        10.0.3.0/24
        │                   │                    │
        └──────────────┬────┴──────────────┘
                       │
                  NAT Gateway
                       │
       ┌───────────────┴────────────────┐
       │                                │
Private App Subnets             Private DB Subnets
10.0.11.0/24                    10.0.21.0/24
10.0.12.0/24                    10.0.22.0/24
10.0.13.0/24                    10.0.23.0/24
```

---

# Infrastructure Components

## VPC

| Property | Value |
|----------|-------|
| CIDR | 10.0.0.0/16 |
| DNS Hostnames | Enabled |
| DNS Support | Enabled |

---

## Public Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.1.0/24 |
| us-east-1b | 10.0.2.0/24 |
| us-east-1c | 10.0.3.0/24 |

Features

- Auto Assign Public IP
- Internet Access
- ELB Ready

---

## Private Application Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.11.0/24 |
| us-east-1b | 10.0.12.0/24 |
| us-east-1c | 10.0.13.0/24 |

Features

- No Public IP
- Internet access through NAT Gateway
- Internal Load Balancer Ready

---

## Private Database Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.21.0/24 |
| us-east-1b | 10.0.22.0/24 |
| us-east-1c | 10.0.23.0/24 |

Features

- Fully Isolated
- No Internet Access
- Suitable for RDS

---

# Networking Components

## Internet Gateway

Provides internet connectivity to public subnets.

---

## NAT Gateway

Located in the first public subnet.

Purpose:

- Allows outbound internet traffic
- Keeps private instances inaccessible from internet

---

## Route Tables

### Public Route Table

```
0.0.0.0/0
     │
Internet Gateway
```

Associated with:

- Public Subnet 1
- Public Subnet 2
- Public Subnet 3

---

### Private App Route Table

```
0.0.0.0/0
      │
 NAT Gateway
```

Associated with:

- Private App Subnet 1
- Private App Subnet 2
- Private App Subnet 3

---

### Private DB Route Table

No Internet Route

Used for isolated database subnets.

---

# Resource Flow

```text
Internet
    │
Internet Gateway
    │
Public Route Table
    │
Public Subnets
    │
NAT Gateway
    │
Private App Route Table
    │
Private App Subnets
    │
Application
    │
Private DB Route Table
    │
Database Subnets
```

---

# Outputs

Terraform exports:

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private App Subnet IDs
- Private DB Subnet IDs

---

# High Availability

✔ Multi Availability Zone Deployment

- us-east-1a
- us-east-1b
- us-east-1c

---

# Security Design

Public Layer

- Internet Accessible
- Load Balancers
- NAT Gateway

Application Layer

- Private
- No Public IP
- Internet through NAT

Database Layer

- Completely Private
- No Internet Route

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Project Structure

```text
terraform-vpc/
│
├── backend.tf          # Terraform backend configuration
├── provider.tf         # AWS provider configuration
├── versions.tf         # Terraform & provider version constraints
├── variables.tf        # Input variable definitions
├── terraform.tfvars    # Variable values
├── outputs.tf          # Terraform outputs
│
├── vpc.tf              # Creates the VPC and configures DNS settings
├── tags.tf             # Common resource tags
├── subnet.tf           # Public, private application, and private database subnets
├── igw.tf              # Internet Gateway
├── nat.tf              # Elastic IP and NAT Gateway
├── route_table.tf      # Route tables and subnet associations
│
└── README.md           # Project documentation
```

## File Description

| File | Purpose |
|------|---------|
| `backend.tf` | Configures the Terraform backend for state management. |
| `provider.tf` | Configures the AWS provider and AWS region. |
| `versions.tf` | Defines the required Terraform and AWS provider versions. |
| `variables.tf` | Declares all input variables used in the project. |
| `terraform.tfvars` | Stores values for the declared variables. |
| `outputs.tf` | Exports useful resource IDs and attributes. |
| `vpc.tf` | Creates the AWS VPC and enables DNS support and DNS hostnames. |
| `tags.tf` | Defines common tags applied to all AWS resources. |
| `subnet.tf` | Creates public, private application, and private database subnets across multiple Availability Zones. |
| `igw.tf` | Creates and attaches the Internet Gateway to the VPC. |
| `nat.tf` | Creates an Elastic IP and NAT Gateway for outbound internet access from private subnets. |
| `route_table.tf` | Creates public/private route tables and associates them with the appropriate subnets. |
| `README.md` | Project documentation, architecture diagrams, deployment instructions, and project overview. |

---

# Best Practices

- Infrastructure as Code
- Multi-AZ Architecture
- Isolated Database Layer
- NAT Gateway for Private Resources
- Separate Route Tables
- Tagged Resources
- Scalable Design

---

# Future Improvements

- Bastion Host
- AWS ALB
- Auto Scaling Group
- ECS/EKS
- RDS
- VPC Endpoints
- CloudWatch
- AWS WAF
- Transit Gateway
- Terraform Modules

---

## License

MIT License
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\route_table.tf

```tf
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "public-route-table"
    }
  )
}

resource "aws_route_table" "private_app_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "private-app-route-table"
    }
  )
}

resource "aws_route_table" "private_db_RT" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "public_association" {
  count = 3

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "private_app_association" {
  count = 3

  subnet_id      = aws_subnet.private_app_subnets[count.index].id
  route_table_id = aws_route_table.private_app_RT.id
}

resource "aws_route_table_association" "private_db_association" {
  count = 3

  subnet_id      = aws_subnet.private_db_subnets[count.index].id
  route_table_id = aws_route_table.private_db_RT.id
}

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\subnet.tf

```tf
resource "aws_subnet" "public_subnets" {
  count = 3

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {

      Name = "public-subnet-${count.index + 1}"

      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "private_app_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_app_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-app-subnet-${count.index + 1}"

      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}

# Database subnets remain isolated and intentionally have no default internet route.
resource "aws_subnet" "private_db_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_db_subnets_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-db-subnet-${count.index + 1}"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\tags.tf

```tf
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\terraform.tf

```tf

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\variables.tf

```tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}

variable "availability_zones" {
  type = list(string)

  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "public_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "private_app_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]
}

variable "private_db_subnets_cidrs" {
  type = list(string)

  default = [
    "10.0.21.0/24",
    "10.0.22.0/24",
    "10.0.23.0/24"
  ]
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\versions.tf

```tf
terraform {
  required_version = ">=1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\network\vpc.tf

```tf
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-vpc"
    }
  )
}

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\clean_old_amis.sh

```sh

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\cleanup_launch_template_versions.sh

```sh

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\automation\lifecycle_policies.md

```md

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\platform\backend.tf

```tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "platform/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\alb_public_sg.tf

```tf
resource "aws_security_group" "alb_public" {
  name        = "${var.project_name}-alb-public-sg"
  description = "Security Group for the Public Application Load Balancer"
  vpc_id      = local.network.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-alb-public-sg"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\application_sg.tf

```tf

```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\backend.tf

```tf
terraform {
  backend "s3" {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "security/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\data.tf

```tf
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket         = "enterprise-devsecops-tfstate-412305"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devsecops-admin"
    dynamodb_table = "terraform-state-lock"
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\database_sg.tf

```tf
resource "aws_security_group" "database_sg" {
  name        = "${var.project_name}-database-sg"
  description = "Security Group for RDS Database"
  vpc_id      = local.network.vpc_id

  ingress {
    description     = "Allow MySQL traffic from EKS Worker Nodes"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_node.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-database-sg"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\eks_cluster_sg.tf

```tf
resource "aws_security_group" "eks_cluster" {
  name        = "${var.project_name}-eks-cluster-sg"
  description = "Security Group for Amazon EKS Control Plane"
  vpc_id      = local.network.vpc_id
  ingress {
    description = "Allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-eks-cluster-sg"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\eks_node_sg.tf

```tf
resource "aws_security_group" "eks_node" {
  name        = "${var.project_name}-eks-node-sg"
  description = "Security Group for EKS Managed Worker Nodes"
  vpc_id      = local.network.vpc_id

  ingress {
    description = "Allow worker node to worker node communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description     = "Allow control plane to communicate with worker nodes"
    from_port       = 1025
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_cluster.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-node-sg"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\locals.tf

```tf
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
locals {
  network = data.terraform_remote_state.network.outputs
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\nacls.tf

```tf
# NACLs for public subnets
resource "aws_network_acl" "public_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.public_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-nacl"
    }
  )
}

# NACLs for private app subnets
resource "aws_network_acl" "private_app_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_app_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}${var.environment}-private-app-nacl"
    }
  )
}

# NACLs for private db subnets
resource "aws_network_acl" "private_db_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_db_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-db-nacl"
    }
  )
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\outputs.tf

```tf
output "eks_node_sg_id" {
  value = aws_security_group.eks_node.id
}
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster.id
}
output "database_sg_id" {
  value = aws_security_group.database_sg.id
}
output "alb_public_sg_id" {
  value = aws_security_group.alb_public.id
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\provider.tf

```tf
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\readme.md

```md
# AWS Security Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-Security-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)
![License](https://img.shields.io/badge/License-MIT-success)

---

# Overview

This Terraform project provisions the **Security Layer** for a three-tier AWS infrastructure.

It creates security components for:

- Public Application Load Balancer
- Amazon EKS Control Plane
- Amazon EKS Worker Nodes
- Amazon RDS Database
- Public Network ACL
- Private Application Network ACL
- Private Database Network ACL

The project consumes the **Network Module** using Terraform Remote State to retrieve the existing VPC and subnet information.

---

# Architecture

```text
                    Internet
                        │
                Public Network ACL
                        │
                ALB Security Group
                        │
                 Public Subnets
                        │
         ─────────────────────────────────
                        │
          Private App Network ACL
                        │
          EKS Worker Node Security Group
                        │
                EKS Cluster SG
                        │
         ─────────────────────────────────
                        │
          Private DB Network ACL
                        │
            Database Security Group
                        │
                   Amazon RDS
```

---

# Security Architecture

```text
                +----------------------+
                |      Internet        |
                +----------+-----------+
                           |
                           |
              +------------v------------+
              |   Public Security SG    |
              |     ALB (80,443)        |
              +------------+------------+
                           |
                    Public Subnets
                           |
              +------------v------------+
              |      EKS Worker SG      |
              +------------+------------+
                           |
              +------------v------------+
              |    EKS Cluster SG       |
              +------------+------------+
                           |
              +------------v------------+
              |      Database SG        |
              |      MySQL 3306         |
              +-------------------------+
```

---

# Components

## Network ACLs

### Public NACL

Allows

- HTTP (80)
- HTTPS (443)
- Ephemeral Ports (1024-65535)

Outbound

- All traffic

---

### Private Application NACL

Allows

- Internal VPC Communication

Outbound

- Internet via NAT

---

### Private Database NACL

Allows

- MySQL (3306)
- Ephemeral Ports
- Internal VPC Communication

Outbound

- Internal VPC Communication

---

# Security Groups

## Application Load Balancer Security Group

### Inbound

| Port | Protocol | Source |
|-------|----------|--------|
|80|TCP|0.0.0.0/0|
|443|TCP|0.0.0.0/0|

Outbound

- All Traffic

---

## Amazon EKS Cluster Security Group

### Inbound

No inbound rules by default.

Outbound

- All Traffic

---

## Amazon EKS Worker Node Security Group

### Inbound

- Worker Node to Worker Node Communication

Outbound

- All Traffic

---

## Database Security Group

### Inbound

| Port | Source |
|-------|---------|
|3306|EKS Worker Node Security Group|

Outbound

- All Traffic

---

# Resource Relationship

```text
Internet
    │
    ▼
ALB Security Group
    │
    ▼
Public Subnets
    │
    ▼
EKS Worker Nodes
    │
    ▼
Database Security Group
    │
    ▼
Amazon RDS
```

---

# Terraform Remote State

This project retrieves networking resources from the Network Module.

Remote outputs include

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private Application Subnet IDs
- Private Database Subnet IDs

---

# Outputs

Terraform exports

| Output | Description |
|----------|-------------|
| alb_public_sg_id | Public ALB Security Group |
| eks_cluster_sg_id | EKS Cluster Security Group |
| eks_node_sg_id | EKS Worker Node Security Group |
| database_sg_id | Database Security Group |

---

```text
terraform-security/
│
├── backend.tf              # Remote backend configuration
├── provider.tf             # AWS provider configuration
├── versions.tf             # Terraform and provider version constraints
├── variables.tf            # Input variable declarations
├── terraform.tfvars        # Variable values
├── outputs.tf              # Exported resource outputs
│
├── data.tf                 # Terraform remote state and data sources
├── locals.tf               # Local values and reusable expressions
├── tags.tf                 # Common tags for all resources
│
├── nacls.tf                # Public, Private App, and Private DB Network ACLs
├── alb_public_sg.tf        # Public Application Load Balancer Security Group
├── eks_cluster_sg.tf       # Amazon EKS Control Plane Security Group
├── eks_node_sg.tf          # Amazon EKS Worker Node Security Group
├── database_sg.tf          # Amazon RDS Database Security Group
│
└── README.md               # Project documentation
```

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Deploy

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Security Design

✔ Layered Security

✔ Least Privilege Access

✔ Separate Network ACLs

✔ Dedicated Security Groups

✔ Database Isolation

✔ Internal Communication Restricted

✔ Multi-AZ Ready

✔ Terraform Remote State Integration

---

# Best Practices

- Infrastructure as Code (IaC)
- Modular Terraform Design
- Remote State Management
- Reusable Security Groups
- Network Segmentation
- Principle of Least Privilege
- Multi-tier Security Architecture
- Environment Tagging

---

# Future Enhancements

- AWS WAF
- AWS Shield
- Security Hub
- GuardDuty
- IAM Roles for Service Accounts (IRSA)
- VPC Endpoints
- Secrets Manager Integration
- ACM Certificates
- AWS Network Firewall

---

## License

MIT License
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\variables.tf

```tf
variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "environment" {
  type = string
}
variable "project_name" {
  type    = string
  default = "enterprise-devsecops"
}
```

## c:\srj412305_workspace\resume project\Enterprise_DevSecOps_Platform\infrastructure_repo\terraform\security\versions.tf

```tf
terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

