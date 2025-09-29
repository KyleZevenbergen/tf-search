# Query configuration for discovering AWS instances
# This file defines queries to find unmanaged AWS instances

# Query for instances based on state filter
list "aws_instance" "filtered_instances" {
  provider = aws
  limit = var.query_limit
  
  config {
    region = var.aws_region
    filter {
      name   = "instance-state-name"
      values = var.instance_state_filter
    }
  }
}

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
