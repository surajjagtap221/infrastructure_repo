# Configure kubectl Access to the Amazon EKS Cluster

After successfully provisioning the Amazon EKS Control Plane using Terraform, configure your local Kubernetes client (`kubectl`) to communicate with the cluster.

## Update kubeconfig

Run the following command:

```bash
aws eks update-kubeconfig \
  --region us-east-1 \
  --name enterprise-devsecops-dev-cluster \
  --profile devsecops-admin
```

This command updates your local Kubernetes configuration (`~/.kube/config`) with the following information:

- EKS Cluster Endpoint
- Cluster Certificate Authority (CA)
- Authentication Configuration
- Cluster Context

No AWS resources are created or modified. The command only updates your local machine's Kubernetes configuration.

---

## Verify Cluster Connectivity

Verify that `kubectl` can communicate with the EKS Control Plane.

```bash
kubectl cluster-info
```

Expected output:

```
Kubernetes control plane is running at https://<cluster-endpoint>
CoreDNS service is running...
```

---

## Verify Worker Nodes

Check whether worker nodes have joined the cluster.

```bash
kubectl get nodes
```

### Expected Output

Before creating the Managed Node Group:

```text
No resources found
```

After creating the Managed Node Group:

```text
NAME                             STATUS   ROLES    AGE   VERSION
ip-10-0-11-xxx.ec2.internal      Ready    <none>   ...   ...
ip-10-0-12-xxx.ec2.internal      Ready    <none>   ...   ...
```

---

## Why This Step is Required

The Kubernetes CLI (`kubectl`) requires connection information before it can communicate with an Amazon EKS cluster.

The `aws eks update-kubeconfig` command retrieves the cluster details from AWS and stores them in the local kubeconfig file, enabling secure authentication using your AWS IAM credentials.

Without this step, commands such as:

```bash
kubectl get nodes
kubectl get pods
kubectl get namespaces
kubectl get services
```

will fail because `kubectl` does not know which Kubernetes cluster to connect to.

---

## Prerequisites

Ensure the following are installed and configured:

- AWS CLI v2
- kubectl
- Valid AWS CLI profile (`devsecops-admin`)
- Amazon EKS Cluster in the `ACTIVE` state

---

## Validate the Cluster Status

```bash
aws eks describe-cluster \
  --name enterprise-devsecops-dev-cluster \
  --region us-east-1 \
  --profile devsecops-admin \
  --query "cluster.status"
```

Expected output:

```text
"ACTIVE"
```


# Amazon EC2 Launch Template

This Launch Template defines the configuration for Amazon EKS worker nodes. It provides a reusable blueprint that AWS uses whenever a new worker node is launched or replaced.

## Features

- 30 GiB encrypted **gp3** root volume
- IMDSv2 enforced for enhanced security
- Detailed CloudWatch monitoring enabled
- Automatic deletion of EBS volume on instance termination
- Standardized resource tagging
- Automatic update to the latest launch template version

## Why Use a Launch Template?

Using a Launch Template ensures that all EKS worker nodes are launched with consistent, secure, and production-ready configurations while allowing future customization without modifying the Managed Node Group.


