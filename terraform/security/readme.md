# AWS Security Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.15-blue)
![AWS](https://img.shields.io/badge/AWS-Security-orange)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-green)
![License](https://img.shields.io/badge/License-MIT-success)

---

# Overview

This Terraform project provisions the **Security Layer** for a three-tier AWS infrastructure.

It creates security components for:

- Public Application Load Balancer
- Amazon EKS Control Plane
- Amazon EKS Worker Nodes
- Amazon RDS Database
- Public Network ACL
- Private Application Network ACL
- Private Database Network ACL

The project consumes the **Network Module** using Terraform Remote State to retrieve the existing VPC and subnet information.

---

# Architecture

```text
                    Internet
                        │
                Public Network ACL
                        │
                ALB Security Group
                        │
                 Public Subnets
                        │
         ─────────────────────────────────
                        │
          Private App Network ACL
                        │
          EKS Worker Node Security Group
                        │
                EKS Cluster SG
                        │
         ─────────────────────────────────
                        │
          Private DB Network ACL
                        │
            Database Security Group
                        │
                   Amazon RDS
```

---

# Security Architecture

```text
                +----------------------+
                |      Internet        |
                +----------+-----------+
                           |
                           |
              +------------v------------+
              |   Public Security SG    |
              |     ALB (80,443)        |
              +------------+------------+
                           |
                    Public Subnets
                           |
              +------------v------------+
              |      EKS Worker SG      |
              +------------+------------+
                           |
              +------------v------------+
              |    EKS Cluster SG       |
              +------------+------------+
                           |
              +------------v------------+
              |      Database SG        |
              |      MySQL 3306         |
              +-------------------------+
```

---

# Components

## Network ACLs

### Public NACL

Allows

- HTTP (80)
- HTTPS (443)
- Ephemeral Ports (1024-65535)

Outbound

- All traffic

---

### Private Application NACL

Allows

- Internal VPC Communication

Outbound

- Internet via NAT

---

### Private Database NACL

Allows

- MySQL (3306)
- Ephemeral Ports
- Internal VPC Communication

Outbound

- Internal VPC Communication

---

# Security Groups

## Application Load Balancer Security Group

### Inbound

| Port | Protocol | Source |
|-------|----------|--------|
|80|TCP|0.0.0.0/0|
|443|TCP|0.0.0.0/0|

Outbound

- All Traffic

---

## Amazon EKS Cluster Security Group

### Inbound

No inbound rules by default.

Outbound

- All Traffic

---

## Amazon EKS Worker Node Security Group

### Inbound

- Worker Node to Worker Node Communication

Outbound

- All Traffic

---

## Database Security Group

### Inbound

| Port | Source |
|-------|---------|
|3306|EKS Worker Node Security Group|

Outbound

- All Traffic

---

# Resource Relationship

```text
Internet
    │
    ▼
ALB Security Group
    │
    ▼
Public Subnets
    │
    ▼
EKS Worker Nodes
    │
    ▼
Database Security Group
    │
    ▼
Amazon RDS
```

---

# Terraform Remote State

This project retrieves networking resources from the Network Module.

Remote outputs include

- VPC ID
- VPC CIDR
- Public Subnet IDs
- Private Application Subnet IDs
- Private Database Subnet IDs

---

# Outputs

Terraform exports

| Output | Description |
|----------|-------------|
| alb_public_sg_id | Public ALB Security Group |
| eks_cluster_sg_id | EKS Cluster Security Group |
| eks_node_sg_id | EKS Worker Node Security Group |
| database_sg_id | Database Security Group |

---

```text
terraform-security/
│
├── backend.tf              # Remote backend configuration
├── provider.tf             # AWS provider configuration
├── versions.tf             # Terraform and provider version constraints
├── variables.tf            # Input variable declarations
├── terraform.tfvars        # Variable values
├── outputs.tf              # Exported resource outputs
│
├── data.tf                 # Terraform remote state and data sources
├── locals.tf               # Local values and reusable expressions
├── tags.tf                 # Common tags for all resources
│
├── nacls.tf                # Public, Private App, and Private DB Network ACLs
├── alb_public_sg.tf        # Public Application Load Balancer Security Group
├── eks_cluster_sg.tf       # Amazon EKS Control Plane Security Group
├── eks_node_sg.tf          # Amazon EKS Worker Node Security Group
├── database_sg.tf          # Amazon RDS Database Security Group
│
└── README.md               # Project documentation
```

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

Deploy

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Security Design

✔ Layered Security

✔ Least Privilege Access

✔ Separate Network ACLs

✔ Dedicated Security Groups

✔ Database Isolation

✔ Internal Communication Restricted

✔ Multi-AZ Ready

✔ Terraform Remote State Integration

---

# Best Practices

- Infrastructure as Code (IaC)
- Modular Terraform Design
- Remote State Management
- Reusable Security Groups
- Network Segmentation
- Principle of Least Privilege
- Multi-tier Security Architecture
- Environment Tagging

---

# Future Enhancements

- AWS WAF
- AWS Shield
- Security Hub
- GuardDuty
- IAM Roles for Service Accounts (IRSA)
- VPC Endpoints
- Secrets Manager Integration
- ACM Certificates
- AWS Network Firewall

---

## License

MIT License