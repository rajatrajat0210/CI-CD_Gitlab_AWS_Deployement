# CI-CD_Gitlab_AWS_Deployement
# 🚀 Terraform AWS Deployment with GitLab CI/CD

![image alt]()
![image alt]()

## 📌 Overview
This project automates the provisioning of AWS infrastructure using **Terraform** and deploys it via a **GitLab CI/CD pipeline**. The setup ensures efficient, repeatable, and secure infrastructure management.

## 🎯 Features
- **Infrastructure as Code (IaC)** using Terraform
- **Automated CI/CD pipeline** with GitLab
- **AWS resource provisioning** (S3, EC2, RDS, etc.)
- **State management** using S3 & DynamoDB for remote backend
- **Role-based IAM policies** for secure access

## 🏗️ Architecture
```
GitLab CI/CD ➝ Terraform ➝ AWS (S3, EC2, RDS, etc.)
```
- **Terraform Backend:** S3 + DynamoDB (for state locking)
- **Pipeline Stages:** Linting → Plan → Apply
- **Deployment Target:** AWS (EC2, RDS, VPC, IAM, etc.)

## 📌 Prerequisites
Ensure you have the following tools installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- GitLab account with repository access

## 🚀 Getting Started
### 1️⃣ Clone the Repository
```sh
 git clone https://gitlab.com/your-repo.git
 cd your-repo
```

### 2️⃣ Configure AWS Credentials
```sh
 export AWS_ACCESS_KEY_ID="your-access-key"
 export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

### 3️⃣ Initialize Terraform
```sh
 terraform init
```

### 4️⃣ Plan and Apply Infrastructure
```sh
 terraform plan
 terraform apply -auto-approve
```

## 🔄 GitLab CI/CD Pipeline
The **`.gitlab-ci.yml`** automates the Terraform deployment:

```yaml
stages:
  - validate
  - plan
  - apply

tf_validate:
  script:
    - terraform init
    - terraform validate
  stage: validate

tf_plan:
  script:
    - terraform plan
  stage: plan

tf_apply:
  script:
    - terraform apply -auto-approve
  stage: apply
```

## 🔍 State Management
Terraform stores state remotely in an S3 bucket with DynamoDB for state locking:
```hcl
backend "s3" {
  bucket         = "your-terraform-state-bucket"
  key           = "terraform.tfstate"
  region        = "us-east-1"
  dynamodb_table = "terraform-locks"
}
```

## 💡 Contributing
Feel free to contribute by submitting issues or pull requests! 🚀
