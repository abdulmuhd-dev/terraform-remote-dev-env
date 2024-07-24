
# Terraform Configuration for Provisioning EC2 Remote Development Enviroment

[![Terraform Code Test](https://github.com/abdulmuhd-dev/terraform-remote-dev-env/actions/workflows/validate.yaml/badge.svg)](https://github.com/abdulmuhd-dev/terraform-remote-dev-env/actions/workflows/validate.yaml)

## Overview
This README provides instructions for using Terraform to automate the provisioning of an EC2 instance for development purposes on AWS.
It enables you to use visual studio locally to communicate to the remote enviroment using (Remote-SSH) plugin.

## Prerequisites
Before you begin, ensure you have the following:
- AWS account credentials with appropriate permissions.
- Terraform installed locally. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Configuration Steps
1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review and Modify Variables:**
   - Open `variables.tf` or `terraform.tfvars` to review and update any required variables such as `aws_region`, `instance_type`, etc.
     ```hcl
     # Example terraform.tfvars
     dev_region = "us-east-1"
     host_os = "unix"  # Specify 'windows' if your host OS is Windows
     public_key_path_with_filename = "~/.ssh/dev-env-key.pub"
     private_key_path_with_filename = "~/.ssh/dev-env-key"
     ```
     **Feel free to customize `terraform.tfvars` with your specific variable values.**

4. **Review and Apply Configuration:**
   - Ensure `main.tf` aligns with your requirements.
   - Apply the Terraform configuration:
     ```bash
     terraform apply
     ```
     Follow prompts and confirm with `yes`.

5. **Accessing the EC2 Instance:**
   - After Terraform completes provisioning, access the EC2 instance using SSH or appropriate methods.

## Cleanup
- To remove resources managed by Terraform when no longer needed:
  ```bash
  terraform destroy
  ```
  Confirm with `yes` when prompted.

## Notes
- Verify AWS credentials are correctly set in your environment (`~/.aws/credentials` or environment variables).
- Adjust `main.tf` as needed for your specific deployment requirements.

## Additional Resources
For more information on Terraform and AWS:
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS Documentation](https://docs.aws.amazon.com/index.html)

This README guides you through setting up and managing an EC2 instance using Terraform, ensuring efficient and reproducible infrastructure provisioning for development environments on AWS. Adjustments to variables and configurations can be made as per your project's needs.