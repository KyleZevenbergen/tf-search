# Terraform Bulk Import Demo for HCP Terraform

This demo demonstrates how to use Terraform's bulk import functionality with HCP Terraform to discover and import existing AWS instances.

## Prerequisites

- **HCP Terraform account** with appropriate permissions
- **Terraform v1.12 or newer** (bulk import functionality is not available in older versions)
- AWS credentials configured in HCP Terraform
- AWS instances running in the us-east-1 region

**Note**: This demo requires Terraform v1.12+ for the `terraform query` command and works with HCP Terraform.

## Files

- `main.tf` - Main Terraform configuration with AWS provider
- `variables.tf` - Variable definitions for configuration
- `query.tfquery.hcl` - Basic query configuration to discover AWS instances
- `advanced-query.tfquery.hcl` - Advanced query examples with various filters
- `README.md` - This file

## Setup

1. **Connect to HCP Terraform via VCS**:
   - Connect your repository to HCP Terraform using the VCS workflow
   - This will automatically sync your configuration files

2. **Configure variables in HCP Terraform**:
   - Go to your HCP Terraform workspace settings
   - Set the required variables as workspace variables

3. **Configure AWS credentials in HCP Terraform**:
   - Go to your HCP Terraform workspace settings
   - Add AWS credentials as environment variables or use AWS IAM roles

## Configuration Variables

The following variables can be configured in HCP Terraform workspace variables:

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `aws_region` | AWS region to search for instances | `"us-east-1"` | No |
| `query_limit` | Maximum instances to return per query | `50` | No |
| `instance_state_filter` | Instance states to filter by | `["running"]` | No |
| `environment_tags` | Environment tags to filter by | `["production", "staging", "development"]` | No |
| `instance_types` | Instance types to filter by | `["t3.large", "t3.xlarge", "m5.large", "m5.xlarge"]` | No |
| `vpc_id` | VPC ID to filter by (optional) | `""` | No |
| `security_group_id` | Security group ID to filter by (optional) | `""` | No |

**Note**: The `hcp_organization` and `hcp_workspace` variables are no longer needed since you're using the VCS workflow.

## Usage

### 1. Initialize Terraform

```bash
terraform init
```

This will connect to your HCP Terraform workspace and download the AWS provider.

### 2. Test the Query

First, test the query to see what instances would be discovered:

```bash
terraform query
```

For JSON output:
```bash
terraform query -json
```

### 3. Generate Import Configuration

Generate the configuration file for importing discovered resources:

```bash
terraform query -generate-config-out=generated.tf
```

This will create a `generated.tf` file containing `resource` and `import` blocks for all discovered instances.

### 4. Import Resources

Copy the generated configuration to your main.tf file and run:

```bash
terraform apply
```

This will import the discovered AWS instances into your HCP Terraform state.

### 5. Clean Up

After importing, you can:
- Remove the `import` blocks from your configuration (they're only needed once)
- Delete the `generated.tf` file
- Keep the `resource` blocks to manage the imported instances

## HCP Terraform UI

You can also run queries and import resources directly from the HCP Terraform UI:

1. Upload your configuration files to your workspace
2. Use the "Import existing resources" feature in the UI
3. Follow the guided process to discover and import resources

## Query Configuration

The `query.tfquery.hcl` file contains:

- A query for all running instances in us-east-1
- An optional commented query for instances with specific tags
- Configurable limits and filters

You can modify the query configuration to:
- Change the region
- Add additional filters
- Modify the limit of results
- Query for different resource types

## Supported Resource Types

This demo focuses on `aws_instance` resources. The bulk import feature also supports:
- `aws_batch_job_queue`
- `aws_cloudwatch_log_group`
- `aws_iam_role`

## Notes

- Make sure you have appropriate AWS permissions to list EC2 instances
- The query will only find instances that are not already managed by Terraform
- You can run the query multiple times, but you'll need to delete `generated.tf` before regenerating it
