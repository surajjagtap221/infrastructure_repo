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
  ebs_optimized = true

  vpc_security_group_ids = [local.security.eks_node_sg_id]

  monitoring {
    enabled = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  lifecycle {
    create_before_destroy = true
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