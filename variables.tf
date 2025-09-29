# Variables for Terraform Bulk Import Demo
# Note: HCP organization and workspace are managed via VCS workflow

variable "aws_region" {
  description = "AWS region to search for instances"
  type        = string
  default     = "us-east-1"
}

variable "instance_state_filter" {
  description = "Instance state to filter by"
  type        = list(string)
  default     = ["running"]
}

variable "query_limit" {
  description = "Maximum number of instances to return per query"
  type        = number
  default     = 500
}

variable "environment_tags" {
  description = "Environment tags to filter instances by"
  type        = list(string)
  default     = ["prod", "stage", "dev"]
}

variable "instance_types" {
  description = "Instance types to filter by"
  type        = list(string)
  default     = ["t3.large", "t3.xlarge", "m5.large", "m5.xlarge"]
}

variable "vpc_id" {
  description = "VPC ID to filter instances by (optional)"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "Security group ID to filter instances by (optional)"
  type        = string
  default     = ""
}
