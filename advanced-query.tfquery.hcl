# Advanced query configuration for discovering AWS instances
# This file demonstrates more sophisticated filtering and querying options

# Query for instances with specific environment tags
list "aws_instance" "tagged_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "tag:Environment"
      values = var.environment_tags
    }
    filter {
      name = "instance-state-name"
      values = var.instance_state_filter
    }
  }
}

# Query for instances by instance type
list "aws_instance" "large_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "instance-type"
      values = var.instance_types
    }
    filter {
      name = "instance-state-name"
      values = var.instance_state_filter
    }
  }
}

# Query for instances by VPC (only if vpc_id is provided)
list "aws_instance" "vpc_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "vpc-id"
      values = [var.vpc_id]
    }
  }
  
  # Only create this query if vpc_id is provided
  count = var.vpc_id != "" ? 1 : 0
}

# Query for instances with specific security groups (only if security_group_id is provided)
list "aws_instance" "secure_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "instance.group-id"
      values = [var.security_group_id]
    }
    filter {
      name = "instance-state-name"
      values = var.instance_state_filter
    }
  }
  
  # Only create this query if security_group_id is provided
  count = var.security_group_id != "" ? 1 : 0
}

# Query for instances by launch time (recent instances)
list "aws_instance" "recent_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "launch-time"
      values = ["2024-01-01T00:00:00.000Z"]  # Instances launched after this date
    }
  }
}
