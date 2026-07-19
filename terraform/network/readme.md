# AWS Three-Tier VPC Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-VPC-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)

## Overview

This Terraform project provisions a production-style AWS networking infrastructure following a three-tier architecture.

The infrastructure consists of:

- Custom VPC
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Route Tables
- Route Table Associations

---

# Architecture

```text
                        Internet
                            │
                    Internet Gateway
                            │
                    ┌──────────────┐
                    │     VPC      │
                    │10.0.0.0/16   │
                    └──────────────┘
                            │
        ┌───────────────────┼────────────────────┐
        │                   │                    │
 Public Subnet AZ1    Public Subnet AZ2   Public Subnet AZ3
   10.0.1.0/24         10.0.2.0/24        10.0.3.0/24
        │                   │                    │
        └──────────────┬────┴──────────────┘
                       │
                  NAT Gateway
                       │
       ┌───────────────┴────────────────┐
       │                                │
Private App Subnets             Private DB Subnets
10.0.11.0/24                    10.0.21.0/24
10.0.12.0/24                    10.0.22.0/24
10.0.13.0/24                    10.0.23.0/24
```

---

# Infrastructure Components

## VPC

| Property | Value |
|----------|-------|
| CIDR | 10.0.0.0/16 |
| DNS Hostnames | Enabled |
| DNS Support | Enabled |

---

## Public Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.1.0/24 |
| us-east-1b | 10.0.2.0/24 |
| us-east-1c | 10.0.3.0/24 |

Features

- Auto Assign Public IP
- Internet Access
- ELB Ready

---

## Private Application Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.11.0/24 |
| us-east-1b | 10.0.12.0/24 |
| us-east-1c | 10.0.13.0/24 |

Features

- No Public IP
- Internet access through NAT Gateway
- Internal Load Balancer Ready

---

## Private Database Subnets

| AZ | CIDR |
|----|------|
| us-east-1a | 10.0.21.0/24 |
| us-east-1b | 10.0.22.0/24 |
| us-east-1c | 10.0.23.0/24 |

Features

- Fully Isolated
- No Internet Access
- Suitable for RDS

---

# Networking Components

## Internet Gateway

Provides internet connectivity to public subnets.

---

## NAT Gateway

Located in the first public subnet.

Purpose:

- Allows outbound internet traffic
- Keeps private instances inaccessible from internet

---

## Route Tables

### Public Route Table

```
0.0.0.0/0
     │
Internet Gateway
```

Associated with:

- Public Subnet 1
- Public Subnet 2
- Public Subnet 3

---

### Private App Route Table

```
0.0.0.0/0
      │
 NAT Gateway
```

Associated with:

- Private App Subnet 1
- Private App Subnet 2
- Private App Subnet 3

---

### Private DB Route Table

No Internet Route

Used for isolated database subnets.

---

# Resource Flow

```text
Internet
    │
Internet Gateway
    │
Public Route Table
    │
Public Subnets
    │
NAT Gateway
    │
Private App Route Table
    │
Private App Subnets
    │
Application
    │
Private DB Route Table
    │
Database Subnets
```

---

# Outputs

Terraform exports:

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private App Subnet IDs
- Private DB Subnet IDs

---

# High Availability

✔ Multi Availability Zone Deployment

- us-east-1a
- us-east-1b
- us-east-1c

---

# Security Design

Public Layer

- Internet Accessible
- Load Balancers
- NAT Gateway

Application Layer

- Private
- No Public IP
- Internet through NAT

Database Layer

- Completely Private
- No Internet Route

---

# Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Project Structure

```text
terraform-vpc/
│
├── backend.tf          # Terraform backend configuration
├── provider.tf         # AWS provider configuration
├── versions.tf         # Terraform & provider version constraints
├── variables.tf        # Input variable definitions
├── terraform.tfvars    # Variable values
├── outputs.tf          # Terraform outputs
│
├── vpc.tf              # Creates the VPC and configures DNS settings
├── tags.tf             # Common resource tags
├── subnet.tf           # Public, private application, and private database subnets
├── igw.tf              # Internet Gateway
├── nat.tf              # Elastic IP and NAT Gateway
├── route_table.tf      # Route tables and subnet associations
│
└── README.md           # Project documentation
```

## File Description

| File | Purpose |
|------|---------|
| `backend.tf` | Configures the Terraform backend for state management. |
| `provider.tf` | Configures the AWS provider and AWS region. |
| `versions.tf` | Defines the required Terraform and AWS provider versions. |
| `variables.tf` | Declares all input variables used in the project. |
| `terraform.tfvars` | Stores values for the declared variables. |
| `outputs.tf` | Exports useful resource IDs and attributes. |
| `vpc.tf` | Creates the AWS VPC and enables DNS support and DNS hostnames. |
| `tags.tf` | Defines common tags applied to all AWS resources. |
| `subnet.tf` | Creates public, private application, and private database subnets across multiple Availability Zones. |
| `igw.tf` | Creates and attaches the Internet Gateway to the VPC. |
| `nat.tf` | Creates an Elastic IP and NAT Gateway for outbound internet access from private subnets. |
| `route_table.tf` | Creates public/private route tables and associates them with the appropriate subnets. |
| `README.md` | Project documentation, architecture diagrams, deployment instructions, and project overview. |

---

# Best Practices

- Infrastructure as Code
- Multi-AZ Architecture
- Isolated Database Layer
- NAT Gateway for Private Resources
- Separate Route Tables
- Tagged Resources
- Scalable Design

---

# Future Improvements

- Bastion Host
- AWS ALB
- Auto Scaling Group
- ECS/EKS
- RDS
- VPC Endpoints
- CloudWatch
- AWS WAF
- Transit Gateway
- Terraform Modules

---

## License

MIT License