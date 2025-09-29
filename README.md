# Terraform Bulk Import Demo for HCP Terraform

This demo demonstrates how to use Terraform's bulk import functionality with HCP Terraform to discover and import existing AWS instances using the **Search & Import** feature.

## Prerequisites

- **HCP Terraform account** with appropriate permissions
- **Terraform v1.14.0-beta or newer** (required for the Search & Import page in HCP Terraform)
- AWS credentials configured in HCP Terraform
- AWS instances running in the us-east-1 region
- **VCS-driven workspace** (recommended) or CLI-driven workspace

**Note**: This feature is currently in beta. Do not use beta functionality in production environments.

## Files

- `main.tf` - Main Terraform configuration with AWS provider
- `variables.tf` - Variable definitions for configuration
- `query.tfquery.hcl` - Basic query configuration to discover AWS instances
- `advanced-query.tfquery.hcl` - Advanced query examples with various filters
- `README.md` - This file

## Setup

1. **Enable Terraform v1.14.0-beta or newer**:
   - Go into your HCP Terraform Organizational settings and enable the "Show Terraform pre-releases" option.
   - Go to your HCP Terraform workspace settings
   - Update the Terraform version to v1.14.0-beta or newer
   - This enables the **Search & Import** page

2. **Connect to HCP Terraform via VCS**:
   - Connect your repository to HCP Terraform using the VCS workflow
   - This will automatically sync your configuration files

3. **Configure variables in HCP Terraform**:
   - Go to your HCP Terraform workspace settings
   - Set the required variables as workspace variables

4. **Configure AWS credentials in HCP Terraform**:
   - Go to your HCP Terraform workspace settings
   - Add AWS credentials as environment variables or use AWS IAM roles

5. **Enable HCP Terraform agents (if using agents)**:
   - If you use HCP Terraform agents, enable the `query` operation when starting the agent pool

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

1. **Define queries in your configuration**:
   - Add `list` blocks to your Terraform configuration (already done in this demo)
   - Commit and push changes to your VCS repository

2. **Run queries in HCP Terraform**:
   - Log into HCP Terraform and navigate to your workspace
   - Click **Search & Import** in the sidebar menu
   - Click **New Query** to start a query
   - HCP Terraform will load the results as the query progresses

3. **Review search results**:
   - HCP Terraform shows management status for each resource:
     - **Managed**: Resource is already managed by Terraform
     - **Unknown**: Resource was applied by an older version
     - **Unmanaged**: Resource is not managed by Terraform
   - Use search bar and filters to sort and filter results
   - Click on resources to view details

4. **Generate and import code**:
   - Select resources you want to import
   - Click **Generate configuration**
   - Copy the generated `import` and `resource` blocks to your configuration
   - Apply the configuration to import resources

### Clean Up

After importing, you can:
- Remove the `import` blocks from your configuration (they're only needed once)
- Keep the `resource` blocks to manage the imported instances

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

## Important Notes

- **Beta Feature**: This feature is currently in beta. Do not use in production environments
- **Terraform Version**: Requires Terraform v1.14.0-beta or newer for the Search & Import UI
- **AWS Permissions**: Ensure you have appropriate AWS permissions to list EC2 instances
- **Resource Management**: HCP Terraform identifies resources managed by other workspaces when using Terraform v1.12+
- **Query Results**: The query will show managed, unknown, and unmanaged resources
- **Multiple Queries**: You can run queries multiple times through the HCP Terraform UI

## References

- [HCP Terraform Import Documentation](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/import#requirements)
- [Terraform Bulk Import Documentation](https://developer.hashicorp.com/terraform/language/v1.14.x/import/bulk)
