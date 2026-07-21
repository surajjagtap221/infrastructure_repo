#############################################################################################
# IAM Trust Policy - Amazon EBS CSI Driver
#############################################################################################

# Create an IAM policy document that defines who is allowed
# to assume the IAM role (Trust Policy).
data "aws_iam_policy_document" "ebs_csi_assume_role" {

  statement {

    # Allow the request if all conditions below are satisfied.
    effect = "Allow"

    # Permit assuming the role using a Kubernetes Service Account
    # through the EKS OIDC provider (IRSA).
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    # Specify the trusted identity provider.
    # This is the OIDC provider associated with the EKS cluster.
    principals {

      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks_oidc.arn
      ]
    }

    # Ensure that only the specified Kubernetes Service Account
    # can assume this IAM role.
    condition {

      test = "StringEquals"

      # Example variable:
      # oidc.eks.<region>.amazonaws.com/id/<OIDC_ID>:sub
      variable = "${local.oidc.issuer}:sub"

      # Format:
      # system:serviceaccount:<namespace>:<service-account-name>
      values = [
        "system:serviceaccount:${local.irsa_service_accounts.ebs_csi.namespace}:${local.irsa_service_accounts.ebs_csi.service_account}"
      ]

    }

    # Verify that the token is intended for AWS STS.
    # This prevents tokens issued for other audiences from
    # being used to assume this role.
    condition {

      test = "StringEquals"

      # Example variable:
      # oidc.eks.<region>.amazonaws.com/id/<OIDC_ID>:aud
      variable = "${local.oidc.issuer}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

  }

}

# IAM Role for Amazon EBS CSI Driver
resource "aws_iam_role" "ebs_csi_irsa_role" {
  name = local.irsa_service_accounts.ebs_csi.iam_role_name

  description = local.irsa_service_accounts.ebs_csi.description

  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = local.irsa_service_accounts.ebs_csi.iam_role_name
    }
  )
}

# IAM Policy Attachment EBS CSI Driver
resource "aws_iam_role_policy_attachment" "ebs_csi_policy_attachment" {
  role       = aws_iam_role.ebs_csi_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

#############################################################################################
#             AWS Load Balancer Conteroller
#############################################################################################

# IAM Trust Policy - AWS Load Balancer Controller
data "aws_iam_policy_document" "alb_controller_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks_oidc.arn
      ]
    }

    condition {
      test = "StringEquals"

      variable = "${local.oidc.issuer}:sub"

      values = [
        "system:serviceaccount:${local.irsa_service_accounts.alb_controller.namespace}:${local.irsa_service_accounts.alb_controller.service_account}"
      ]
    }

    condition {
      test = "StringEquals"

      variable = "${local.oidc.issuer}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }
  }
}

# IAM Role - AWS Load Balancer Controller 
resource "aws_iam_role" "alb_controller_irsa_role" {
  name = local.irsa_service_accounts.alb_controller.iam_role_name

  description = local.irsa_service_accounts.alb_controller.description

  assume_role_policy = data.aws_iam_policy_document.alb_controller_assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = local.irsa_service_accounts.alb_controller.iam_role_name
    }
  )

}

# IAM Custom Policy Document - AWS Load Balancer Controller
data "aws_iam_policy_document" "alb_controller_policy_document" {
  # EC2 Read Permissions
  statement {
    sid    = "EC2ReadPermissions"
    effect = "Allow"

    actions = [
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeAddresses",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeVpcs",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeVpcPeeringConnections"
    ]

    resources = ["*"]
  }

  # Elastic Load Balancer Management
  statement {

    sid    = "ElasticLoadBalancingPermissions"
    effect = "Allow"

    actions = [
      "elasticloadbalancing:CreateLoadBalancer",
      "elasticloadbalancing:DeleteLoadBalancer",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:ModifyLoadBalancerAttributes",

      "elasticloadbalancing:CreateTargetGroup",
      "elasticloadbalancing:DeleteTargetGroup",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:ModifyTargetGroup",
      "elasticloadbalancing:ModifyTargetGroupAttributes",

      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",

      "elasticloadbalancing:DescribeTargetHealth",

      "elasticloadbalancing:SetIpAddressType",
      "elasticloadbalancing:SetSecurityGroups",
      "elasticloadbalancing:SetSubnets",
      "elasticloadbalancing:SetWebAcl",
      "elasticloadbalancing:SetWebAclForResource"
    ]

    resources = ["*"]

  }

  # Listener Management
  statement {

    sid    = "ListenerManagement"
    effect = "Allow"

    actions = [
      "elasticloadbalancing:CreateListener",
      "elasticloadbalancing:DeleteListener",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:ModifyListener"
    ]

    resources = ["*"]
  }

  # Listener Rule Management
  statement {

    sid    = "ListenerRuleManagement"
    effect = "Allow"

    actions = [
      "elasticloadbalancing:CreateRule",
      "elasticloadbalancing:DeleteRule",
      "elasticloadbalancing:DescribeRules",
      "elasticloadbalancing:ModifyRule",
      "elasticloadbalancing:SetRulePriorities"
    ]

    resources = ["*"]

  }

  # Security Group Management
  statement {

    sid    = "SecurityGroupManagement"
    effect = "Allow"

    actions = [
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:CreateSecurityGroup",
      "ec2:DeleteSecurityGroup",
      "ec2:DescribeSecurityGroups",
      "ec2:CreateTags",
      "ec2:DeleteTags"
    ]

    resources = ["*"]

  }

  # Tag Management
  statement {

    sid    = "TagManagement"
    effect = "Allow"

    actions = [
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:RemoveTags",
      "elasticloadbalancing:DescribeTags",

      "ec2:CreateTags",
      "ec2:DeleteTags",
      "ec2:DescribeTags"
    ]

    resources = ["*"]

  }

  # AWS Certificate Manager (ACM)
  statement {

    sid    = "ACMCertificateManagement"
    effect = "Allow"

    actions = [
      "acm:DescribeCertificate",
      "acm:ListCertificates",
      "acm:GetCertificate"
    ]

    resources = ["*"]

  }


  # IAM Service-Linked Role
  statement {

    sid    = "IAMServiceLinkedRole"
    effect = "Allow"

    actions = [
      "iam:CreateServiceLinkedRole"
    ]

    resources = ["*"]

    condition {

      test = "StringEquals"

      variable = "iam:AWSServiceName"

      values = [
        "elasticloadbalancing.amazonaws.com"
      ]
    }

  }


  # AWS WAF Integration
  statement {

    sid    = "WAFIntegration"
    effect = "Allow"

    actions = [
      "wafv2:AssociateWebACL",
      "wafv2:DisassociateWebACL",
      "wafv2:GetWebACL",
      "wafv2:GetWebACLForResource",
      "waf-regional:AssociateWebACL",
      "waf-regional:DisassociateWebACL",
      "waf-regional:GetWebACLForResource"
    ]

    resources = ["*"]

  }


  # AWS Shield Integration
  statement {

    sid    = "ShieldIntegration"
    effect = "Allow"

    actions = [
      "shield:CreateProtection",
      "shield:DeleteProtection",
      "shield:DescribeProtection",
      "shield:GetSubscriptionState",
      "shield:ListProtections"
    ]

    resources = ["*"]

  }


  # Miscellaneous Read Permissions
  statement {

    sid    = "MiscellaneousReadPermissions"
    effect = "Allow"

    actions = [
      # Elastic Load Balancing
      "elasticloadbalancing:DescribeListenerAttributes",
      "elasticloadbalancing:DescribeLoadBalancerAttributes",
      "elasticloadbalancing:DescribeSSLPolicies",

      # EC2
      "ec2:GetCoipPoolUsage",
      "ec2:DescribeCoipPools",

      # Cognito (for ALB authentication)
      "cognito-idp:DescribeUserPoolClient"
    ]

    resources = ["*"]

  }
}

# IAM Policy - AWS Load Balancer Controller
resource "aws_iam_policy" "alb_controller_policy" {
  name        = "${var.project_name}-alb-controller-policy"
  description = "IAM Policy for AWS Load Balancer Controller"

  policy = data.aws_iam_policy_document.alb_controller_policy_document.json

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-alb-controller-policy"
    }
  )
}
# IAM Policy Attachment - AWS Load Balancer controller 
resource "aws_iam_role_policy_attachment" "alb_controller_policy_attachment" {
  role       = aws_iam_role.alb_controller_irsa_role.name
  policy_arn = aws_iam_policy.alb_controller_policy.arn
}


#############################################################################################
#              EKS Cluster Autoscaler
#############################################################################################

#IAM Trust Policy - EKS Cluster Autoscaler 
data "aws_iam_policy_document" "cluster_autoscaler_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks_oidc.arn
      ]
    }

    condition {
      test = "StringEquals"

      variable = "${local.oidc.issuer}:sub"

      values = [
        "system:serviceaccount:${local.irsa_service_accounts.cluster_autoscaler.namespace}:${local.irsa_service_accounts.cluster_autoscaler.service_account}"
      ]
    }

    condition {
      test = "StringEquals"

      variable = "${local.oidc.issuer}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

  }
}

# IAM Role - AWS EKS Cluster Autoscaler
resource "aws_iam_role" "cluster_autoscaler_irsa_role" {
  name = local.irsa_service_accounts.cluster_autoscaler.iam_role_name

  description = local.irsa_service_accounts.cluster_autoscaler.description

  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_assume_role.json

  tags = merge(
    local.common_tags,
    {
      Name = local.irsa_service_accounts.cluster_autoscaler.iam_role_name
    }
  )
}

# IAM Custom Policy Document - AWS EKS Cluster Autoscaler
data "aws_iam_policy_document" "cluster_autoscaler_policy_document" {

  # Auto Scaling Read Permissions
  statement {

    sid    = "AutoScalingReadPermissions"
    effect = "Allow"

    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeScalingActivities",
      "autoscaling:DescribeTags",
      "autoscaling:DescribePolicies",
      "autoscaling:DescribeLifecycleHooks",
      "autoscaling:DescribeTerminationPolicies",
      "autoscaling:DescribeWarmPool"
    ]

    resources = ["*"]

  }

  # Auto Scaling Management Permissions
  statement {

    sid    = "AutoScalingManagementPermissions"
    effect = "Allow"

    actions = [
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup"
    ]

    resources = ["*"]

    # TODO:
    # Restrict these permissions using Auto Scaling Group tags:
    #
    # k8s.io/cluster-autoscaler/enabled = true
    # k8s.io/cluster-autoscaler/<cluster-name> = owned
  }

  # EC2 Read Permissions
  statement {

    sid    = "EC2ReadPermissions"
    effect = "Allow"

    actions = [
      "ec2:DescribeImages",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeInstances",
      "ec2:DescribeLaunchTemplateVersions",
      "ec2:DescribeAvailabilityZones",
      "ec2:GetInstanceTypesFromInstanceRequirements"
    ]

    resources = ["*"]

  }

  # Launch Template Read Permissions
  statement {

    sid    = "LaunchTemplateReadPermissions"
    effect = "Allow"

    actions = [
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeLaunchTemplateVersions"
    ]

    resources = ["*"]

  }

  # EKS Read Permissions
  statement {

    sid    = "EKSReadPermissions"
    effect = "Allow"

    actions = [
      "eks:DescribeCluster",
      "eks:DescribeNodegroup"
    ]

    resources = ["*"]

  }
}

# IAM Policy - AWS EKS Cluster Autoscaler
resource "aws_iam_policy" "cluster_autoscaler_policy" {
  name        = "${var.project_name}-cluster-autoscaler-policy"
  description = "IAM Policy for AWS EKS Cluster Autoscaler"

  policy = data.aws_iam_policy_document.cluster_autoscaler_policy_document.json

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-cluster-autoscaler-policy"
    }
  )
}

# IAM Policy Attachment - AWS EKS Cluster Autoscaler
resource "aws_iam_role_policy_attachment" "cluster_autoscaler_policy_attachment" {
  role       = aws_iam_role.cluster_autoscaler_irsa_role.name
  policy_arn = aws_iam_policy.cluster_autoscaler_policy.arn
}