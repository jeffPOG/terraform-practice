# Terraform AWS Modules

This directory contains a self-contained Terraform configuration that provisions a VPC, EC2 bastion and private instances, Security Groups, Elastic IPs, and an RDS database on AWS.  It is intended as a learning example that demonstrates the use of separate `.tf` files to organise resources, variables, outputs, and modules.

## Prerequisites

1. **Terraform ≥ 1.0** ‑ install from <https://terraform.io> or via Homebrew: `brew install terraform`.
2. **AWS account credentials** with permissions to create VPC, EC2, RDS, and related networking resources.
   • Either export `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`, or set up an `AWS_PROFILE` in `~/.aws/credentials`.
3. **(Optional) SSH key** if you want to connect to the bastion/instances — replace `private-key` with your own.

## File guide

| File/Folder | Purpose |
|-------------|---------|
| `providers.tf` | Declares the AWS provider and required Terraform version. |
| `variables.tf` | Input variables shared across the configuration. |
| `terraform.tfvars` / `vpc.auto.tfvars` | Default values for many input variables. Edit these to fit your AWS account / region. |
| `local-values.tf` | Defines reusable local values derived from variables. |
| `datasource-ami.tf` | Looks up the latest AMI ID for Amazon Linux (or other OS). |
| `vpc-module.tf` | Instantiates the `vpc` module (see `vpc/`) to create Networking resources. |
| `vpc/` | A nested module that actually builds the VPC, subnets, route tables, etc. |
| `securitygroup-*.tf` | Security Group definitions for the bastion and private instances. |
| `ec2instance-bastion.tf` | EC2 bastion host in a public subnet. |
| `ec2instance-private.tf` | One or more private EC2 instances, accessed via the bastion. |
| `elasticip.tf` | Attaches an Elastic IP to the bastion host. |
| `rdssdb.tf` | Creates an RDS instance (MySQL/PostgreSQL) in private subnets.  Parameters & secrets come from `rdssdb-variables.tf`. |
| `nullresource-provisioners.tf` | Demonstrates local-exec/remote-exec provisioners (e.g., bootstrap scripts, file uploads). |
| `outputs.tf`, `rdssdb-outputs.tf` | Expose useful information such as VPC ID, public IP, DB endpoint, etc. |
| `local-exec-output-files/` | Directory where local-exec provisioners write their output (logs, inventory files …). |
| `terraform.tfstate*` | Terraform state files – **do not edit**.  Commit them only if you use local state intentionally. |
| `private-key` | Private SSH key used by provisioners; replace or remove as needed. |
| `apache-install.sh` | Simple bash script executed by provisioners to install Apache on EC2. |

## Usage

```bash
# 1. Navigate to this directory (already here)
cd terraform-aws-modules

# 2. Inspect / customise variables
nano terraform.tfvars             # or use your editor

# 3. Initialise providers and modules
terraform init

# 4. Check the configuration is valid
terraform validate

# 5. See what will be created
terraform plan -out tfplan

# 6. Apply the plan (creates AWS resources)
terraform apply tfplan

# 7. View outputs (public IP, DB endpoint, etc.)
terraform output

# 8. When finished, tear everything down
terraform destroy
```

### Connecting to the bastion host

After `terraform apply` completes, grab the `bastion_public_ip` output:

```bash
ssh -i private-key ec2-user@<bastion_public_ip>
```

From the bastion you can reach private instances or the RDS database endpoint.

## Cleaning up

Running `terraform destroy` will remove all AWS resources created by this configuration.  Remember to delete any local-exec output files or generated artefacts if you no longer need them.

---
Feel free to adjust the structure or add more modules (e.g., S3, IAM) as you explore Terraform’s capabilities.

