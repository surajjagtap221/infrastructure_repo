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


  irsa_service_accounts = {

    ebs_csi = {
      namespace       = "kube-system"
      service_account = "ebs-csi-controller-sa"
      iam_role_name   = "${var.project_name}-ebs-csi-irsa-role"
      description     = "IAM Role for Amazon EBS CSI Driver"
    }

    alb_controller = {
      namespace       = "kube-system"
      service_account = "aws-load-balancer-controller"
      iam_role_name   = "${var.project_name}-alb-controller-irsa-role"
      description     = "IAM Role for AWS Load Balancer Controller"
    }

    cluster_autoscaler = {
      namespace       = "kube-system"
      service_account = "cluster-autoscaler"
      iam_role_name   = "${var.project_name}-cluster-autoscaler-irsa-role"
      description     = "IAM Role for Kubernetes Cluster Autoscaler"
    }

    # external_dns = {
    #   namespace       = "kube-system"
    #   service_account = "external-dns"
    #   iam_role_name   = "${var.project_name}-external-dns-irsa-role"
    #   description     = "IAM Role for ExternalDNS"
    # 
    # }
  }

  oidc = {
    issuer = replace(
      aws_iam_openid_connect_provider.eks_oidc.url,
      "https://",
      ""
    )
  }


}
