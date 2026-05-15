# AWS Serverless Student Platform — Step-by-Step Deployment Guide 🚀

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-black)
![Python](https://img.shields.io/badge/Python-Lambda-blue)
![CloudFront](https://img.shields.io/badge/CloudFront-CDN-green)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Security-red)

---

# Table of Contents

* [Project Overview](#project-overview)
* [Architecture](#architecture)
* [Services Used](#services-used)
* [Folder Structure](#folder-structure)
* [Project Workflow](#project-workflow)
* [Step-by-Step Deployment Guide](#step-by-step-deployment-guide)
* [Frontend Integration](#frontend-integration)
* [CI/CD Pipeline](#cicd-pipeline)
* [CloudFront and DNS Integration](#cloudfront-and-dns-integration)
* [Security Improvements](#security-improvements)
* [Testing the Application](#testing-the-application)
* [Lessons Learned](#lessons-learned)
* [Common Errors and Fixes](#common-errors-and-fixes)
* [Future Improvements](#future-improvements)
* [Screenshots](#screenshots)
* [Author](#author)

---

# Project Overview

This project demonstrates a fully automated AWS Serverless Full Stack deployment using:

* Terraform Infrastructure as Code
* AWS Lambda
* API Gateway HTTP API
* DynamoDB
* AWS Amplify
* CloudFront
* Route53
* ACM Certificates
* GitHub Actions CI/CD
* DevSecOps Security Scanning

The application allows users to:

* Add student records
* Store records in DynamoDB
* Retrieve student records dynamically
* Display data on a frontend hosted with Amplify

The project also demonstrates:

* Modular Terraform design
* Multi-stack Terraform architecture
* Remote state management
* OIDC authentication from GitHub Actions
* Enterprise DevSecOps workflow

---

# Architecture

![Architecture Diagram](assets/architecture-diagram.png)

---

# Services Used

| Service        | Purpose                  |
| -------------- | ------------------------ |
| AWS Lambda     | Backend compute          |
| API Gateway    | HTTP API routing         |
| DynamoDB       | NoSQL database           |
| AWS Amplify    | Frontend hosting         |
| CloudFront     | CDN and HTTPS delivery   |
| Route53        | DNS management           |
| ACM            | SSL certificates         |
| GitHub Actions | CI/CD automation         |
| Terraform      | Infrastructure as Code   |
| CloudWatch     | Logging and monitoring   |
| IAM            | Security and permissions |
| Checkov        | IaC security scanning    |
| TFLint         | Terraform linting        |
| SonarCloud     | Code quality scanning    |

---

# Folder Structure

```bash
terraform-aws-serverless-platform/
│
├── Frontend/
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── config.js
│   └── index.html
│
├── terraform/
│   ├── environments/
│   │   ├── shared/
│   │   └── dev/
│   │
│   └── modules/
│       ├── amplify/
│       ├── api_gateway/
│       ├── cloudfront/
│       ├── dynamodb/
│       ├── iam/
│       ├── lambda/
│       ├── route53/
│       └── acm/
│
├── lambda/
│   ├── GETmethod.py
│   └── POSTmethod.py
│
└── .github/workflows/
    └── terraform.yml
```

---

# Project Workflow

```text
User
  ↓
Route53
  ↓
CloudFront
  ↓
Amplify Frontend
  ↓
API Gateway
  ↓
Lambda Functions
  ↓
DynamoDB
```

---

# Step-by-Step Deployment Guide

# 1. Create the Repository

```bash
git init
```

Push your project to GitHub.

---

# 2. Configure Terraform Backend

Example:

```hcl
terraform {
  backend "s3" {
    bucket         = "mustydain"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

---

# 3. Create Shared Infrastructure Stack

Deploy:

* Route53 Hosted Zone
* ACM Certificates
* Domain Registration
* Shared Logging Buckets

Deploy:

```bash
terraform init
terraform apply
```

---

# 4. Create Environment Stack

Deploy:

* DynamoDB
* Lambda
* IAM
* API Gateway
* Amplify
* CloudFront
* Route53 Alias Records

---

# 5. Configure Lambda Functions

GET Lambda:

* Retrieves records from DynamoDB

POST Lambda:

* Inserts student records into DynamoDB

Important:

Ensure DynamoDB partition key matches the item inserted.

Example:

```python
Item={
    'studentId': unique_id,
    'roll_number': roll_number,
    'student_name': student_name,
    'student_class': student_class
}
```

---

# 6. Configure API Gateway Routes

Example routes:

```text
GET /students
POST /students
```

Important:

Route naming must match everywhere:

* Terraform outputs
* Frontend config.js
* Amplify environment variables
* API Gateway routes
* JavaScript fetch calls

---

# Frontend Integration

The frontend dynamically receives API endpoints from Amplify environment variables.

Example:

```javascript
window.GET_API = "https://api.example.com/students";
window.POST_API = "https://api.example.com/students";
```

Terraform injects these values during deployment using:

```yaml
sed -i "s|__GET_API__|$GET_API|g" Frontend/js/config.js
```

---

# CI/CD Pipeline

The GitHub Actions pipeline performs:

* Terraform validation
* TFLint scanning
* Checkov security scanning
* SonarCloud analysis
* Pull Request automation
* Terraform plan
* Terraform apply
* Manual destroy approval workflow

---

# GitHub Actions Flow

```text
Push to dev
    ↓
Security Scans
    ↓
Auto Pull Request to Main
    ↓
Merge to Main
    ↓
Terraform Apply
```

---

# CloudFront and DNS Integration

CloudFront sits in front of Amplify.

Flow:

```text
Route53 → CloudFront → Amplify
```

The DNS alias records point custom domains to CloudFront distributions.

Example:

```hcl
resource "aws_route53_record" "primary_a" {
  zone_id = data.terraform_remote_state.shared.outputs.hosted_zone_id

  name = var.app_domain_primary
  type = "A"

  alias {
    name                   = var.cloudfront_distribution_primary_domain_name
    zone_id                = var.cloudfront_distribution_primary_hosted_zone_id
    evaluate_target_health = false
  }
}
```

---

# Security Improvements

Implemented:

* OIDC authentication
* Least privilege IAM roles
* Terraform remote state locking
* DevSecOps pipeline scanning
* CloudFront HTTPS enforcement
* ACM TLS certificates
* GitHub environment approvals

---

# Testing the Application

## Test POST Request

```bash
curl -X POST \
https://your-api.execute-api.us-east-1.amazonaws.com/students \
-H "Content-Type: application/json" \
-d '{
  "roll_number":"1",
  "student_name":"Musty",
  "student_class":"DevOps"
}'
```

---

## Test GET Request

```bash
curl https://your-api.execute-api.us-east-1.amazonaws.com/students
```

---

# Lessons Learned

## 1. Route Naming Consistency Matters

A mismatch between:

* `/Students`
* `/students`

caused API Gateway routing failures.

---

## 2. HTTP API Payload Version Differences

HTTP API v2 payloads behave differently from REST API payloads.

Using:

```python
json.loads(event['body'])
```

was necessary.

---

## 3. DynamoDB Partition Keys Must Match

The DynamoDB table partition key must match the inserted item key.

Example issue:

```text
Missing the key studentId in the item
```

---

## 4. CloudFront + Route53 Dependencies

Separating:

* shared infrastructure
* environment infrastructure

helped avoid Terraform dependency cycles.

---

## 5. Amplify Build Paths Matter

Incorrect frontend file paths caused build failures.

Example:

```text
sed: can't read Frontend/config.js
```

Fix:

```text
Frontend/js/config.js
```

---

## 6. IAM Permissions Are Iterative

Terraform often revealed missing permissions incrementally.

Examples:

* iam:TagPolicy
* dynamodb:DescribeContinuousBackups
* amplify:TagResource
* apigateway:TagResource

---

## 7. CloudFront Should Front Amplify

CloudFront origins should point to:

```text
amplifyapp.com
```

instead of API Gateway.

---

# Common Errors and Fixes

| Error                      | Cause                  | Fix                            |
| -------------------------- | ---------------------- | ------------------------------ |
| Not Found                  | Wrong API route        | Match route names              |
| Internal Server Error      | Lambda exception       | Check CloudWatch logs          |
| Unable to import module    | Wrong Lambda handler   | Match filename and handler     |
| Missing key studentId      | DynamoDB key mismatch  | Match partition key            |
| Terraform cycle dependency | Cross-stack references | Separate shared and env stacks |
| Amplify build failed       | Wrong file path        | Correct config.js path         |

---

# Future Improvements

Potential improvements:

* WAF integration
* Multi-region deployment
* Cognito authentication
* Lambda authorizers
* Blue/Green deployments
* Monitoring dashboards
* Prometheus and Grafana integration
* ArgoCD GitOps integration
* Kubernetes migration option

---

# Screenshots

## Frontend UI

![Frontend UI](screenshots/frontend-ui.png)

---

## GitHub Actions Pipeline

![GitHub Actions](screenshots/github-actions-workflow.png)

---

## DynamoDB Records

![DynamoDB Records](screenshots/dynamodb-records.png)

---

## Amplify Deployment

![Amplify Deployment](screenshots/amplify-deployment.png)

---

# Author

## Odainkey / Effulgence Tech

* GitHub: [https://github.com/dainmusty](https://github.com/dainmusty)
* LinkedIn: [https://linkedin.com](https://linkedin.odainkey-mustapha)

---

# Final Thoughts

This project evolved from a simple serverless application into a production-style cloud engineering platform demonstrating:

* Infrastructure as Code
* CI/CD Automation
* DevSecOps
* Cloud Networking
* DNS Architecture
* Serverless Design Patterns
* Enterprise Terraform Structuring

The project also highlights real-world debugging and operational challenges encountered during cloud-native deployments.
