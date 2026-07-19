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