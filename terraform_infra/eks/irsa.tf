# IAM Trust Policy - Amazon EBS CSI Driver

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
  role = aws_iam_role.ebs_csi_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicy"
}




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

# IAM Role - AWS Load Balencer Controller 
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

# 

# IAM Policy Attachment - AWS Load Balancer controller 
resource "aws_iam_role_policy_attachment" "alb_controller_policy_attachment" {
  role = aws_iam_role.alb_controller_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/Amazon"
}