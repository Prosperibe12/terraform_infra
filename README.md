# Terraform Infrastructure

A modular Terraform project for provisioning AWS cloud infrastructure across multiple environments (dev, staging, production).

## Architecture

This project uses a modular approach with reusable components for:
- **VPC & Networking** - Virtual Private Cloud with subnets and routing
- **Security Groups** - Firewall rules and access controls
- **EC2 Servers** - Compute instances with auto-scaling
- **RDS Database** - Managed PostgreSQL/MySQL databases
- **EKS Cluster** - Kubernetes cluster for container workloads
- **S3 Storage** - Object storage buckets
- **IAM Roles** - Identity and access management
- **Key Pairs** - SSH key management

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Terraform Cloud](https://app.terraform.io/) account with workspace configured
- AWS CLI configured with appropriate credentials
- Access to the Terraform Cloud organization

## Instructions
 - Confgure AWS CLI
 - Create a Terraform Cloud Account and Login
 - Create 3 workspaces and edit the terraform configuration file in dev,staging and prod folder.

### 1. Clone Repository
```bash
git clone https://github.com/Prosperibe12/terraform_infra.git
cd terraform_infra
```

### 2. Deploy to Staging Environment
```bash
cd dev

# Initialize Terraform (connects to Terraform Cloud backend)
terraform init

# Review planned changes
terraform plan

# Deploy infrastructure
terraform apply
```

### 3. Deploy Other Environments
```bash
# For staging
cd ../staging
terraform init
terraform apply

# For production
cd ../prod
terraform init
terraform apply
```