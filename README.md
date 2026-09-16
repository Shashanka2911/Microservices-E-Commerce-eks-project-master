# 🛒 Microservices E-Commerce Platform on Amazon EKS

## 🚀 Production-Ready DevOps & Cloud Deployment Project

This project demonstrates the deployment of a **cloud-native microservices-based e-commerce application on Amazon EKS (Elastic Kubernetes Service)** using modern DevOps and AWS technologies.

The project implements an end-to-end DevOps workflow covering:

* Infrastructure as Code with Terraform
* AWS EKS Kubernetes cluster
* Amazon ECR container registry
* Docker containerization
* Jenkins CI/CD pipelines
* Argo CD GitOps deployment
* Kubernetes microservices
* AWS Load Balancer
* Route 53 DNS
* AWS Certificate Manager
* HTTPS
* Trivy container security scanning

---

## 👨‍💻 Author

**Shashanka S**

GitHub:

**https://github.com/Shashanka2911**

Repository:

**https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master**

---

# 📌 Project Overview

The objective of this project is to deploy a complete microservices-based e-commerce application on AWS using Kubernetes and DevOps automation.

The infrastructure is provisioned using **Terraform**, application container images are built using **Docker**, images are stored in **Amazon ECR**, CI pipelines are implemented using **Jenkins**, and application deployment is managed using **Argo CD** following the GitOps approach.

The application runs on an **Amazon EKS cluster in the `ap-south-1` AWS region**.

---

# 🏗️ Architecture

```text
                         ┌──────────────────────┐
                         │      Developer       │
                         │       GitHub         │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       Jenkins        │
                         │       CI/CD          │
                         └──────────┬───────────┘
                                    │
                              Docker Build
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │      Amazon ECR      │
                         │ Container Registry   │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       Argo CD        │
                         │    GitOps / CD       │
                         └──────────┬───────────┘
                                    │
                                    ▼
                  ┌──────────────────────────────────┐
                  │          Amazon EKS               │
                  │       Kubernetes Cluster          │
                  │                                  │
                  │  ┌────────────────────────────┐  │
                  │  │      Microservices         │  │
                  │  │                            │  │
                  │  │ frontend                   │  │
                  │  │ cartservice                │  │
                  │  │ checkoutservice             │  │
                  │  │ paymentservice              │  │
                  │  │ productcatalogservice       │  │
                  │  │ recommendationservice       │  │
                  │  │ emailservice                │  │
                  │  │ currencyservice             │  │
                  │  │ shippingservice             │  │
                  │  │ adservice                  │  │
                  │  │ loadgenerator               │  │
                  │  └────────────────────────────┘  │
                  └────────────────┬─────────────────┘
                                   │
                                   ▼
                         ┌──────────────────────┐
                         │   AWS Load Balancer  │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │      Route 53        │
                         │    DNS Management    │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │        ACM           │
                         │    SSL Certificate   │
                         └──────────┬───────────┘
                                    │
                                    ▼
                              HTTPS Traffic
                                    │
                                    ▼
                              End Users
```

---

# ☁️ AWS Region

This project is configured for:

```text
AWS Region: ap-south-1
Location: Asia Pacific (Mumbai)
```

Throughout the project, AWS CLI and EKS commands use:

```bash
--region ap-south-1
```

---

# 🛠️ Technologies Used

| Category               | Technology               |
| ---------------------- | ------------------------ |
| Cloud Platform         | AWS                      |
| Region                 | ap-south-1               |
| Compute                | Amazon EC2               |
| Kubernetes             | Amazon EKS               |
| Container Registry     | Amazon ECR               |
| Containerization       | Docker                   |
| Infrastructure as Code | Terraform                |
| CI/CD                  | Jenkins                  |
| GitOps                 | Argo CD                  |
| Orchestration          | Kubernetes               |
| Package Management     | Helm                     |
| Version Control        | Git / GitHub             |
| DNS                    | Route 53                 |
| SSL/TLS                | AWS Certificate Manager  |
| Security Scanning      | Trivy                    |
| Build Tool             | Maven                    |
| CLI Tools              | AWS CLI, kubectl, eksctl |
| Operating System       | Linux                    |

---

# 🧩 Microservices

The application contains the following services:

```text
emailservice
checkoutservice
recommendationservice
frontend
paymentservice
productcatalogservice
cartservice
loadgenerator
currencyservice
shippingservice
adservice
```

Each service is containerized and deployed as a Kubernetes workload.

---

# 📁 Repository Structure

The GitHub repository contains the following major components:

```text
Microservices-E-Commerce-eks-project-master/
│
├── ecr-terraform/
│   └── ECR infrastructure
│
├── eks-terraform/
│   └── EKS infrastructure and Jenkins pipeline
│
├── jenkinsfiles/
│   ├── emailservice
│   ├── checkoutservice
│   ├── recommendationservice
│   ├── frontend
│   ├── paymentservice
│   ├── productcatalogservice
│   ├── cartservice
│   ├── loadgenerator
│   ├── currencyservice
│   ├── shippingservice
│   └── adservice
│
├── kubernetes-files/
│   └── Kubernetes deployment manifests
│
├── s3-buckets/
│   └── Terraform remote-state infrastructure
│
├── src/
│   └── Project source files
│
├── terraform_main_ec2/
│   └── EC2 Jumphost infrastructure
│
├── .gitignore
│
└── README.md
```

---

# 🔄 DevOps Workflow

The complete deployment workflow is:

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
Jenkins
    │
    ├── Checkout Code
    ├── Build
    ├── Test
    ├── Security Scan
    ├── Docker Build
    └── Push Image
            │
            ▼
       Amazon ECR
            │
            ▼
         Argo CD
            │
            ▼
        Amazon EKS
            │
            ▼
      Kubernetes Pods
            │
            ▼
     Kubernetes Services
            │
            ▼
      AWS Load Balancer
            │
            ▼
        Route 53
            │
            ▼
           ACM
            │
            ▼
          HTTPS
            │
            ▼
       E-Commerce App
```

---

# 📋 Prerequisites

Before starting the project, install/configure:

* AWS Account
* AWS CLI
* Terraform
* Git
* Docker
* kubectl
* eksctl
* Helm
* Jenkins
* Java
* Maven

Verify the tools:

```bash
aws --version
terraform --version
docker --version
kubectl version --client
eksctl version
helm version
git --version
java -version
mvn -v
```

---

# 🔐 Step 1: Configure AWS CLI

Run:

```bash
aws configure
```

Enter your AWS credentials:

```text
AWS Access Key ID: <YOUR_ACCESS_KEY>
AWS Secret Access Key: <YOUR_SECRET_KEY>
Default region name: ap-south-1
Default output format: json
```

Verify:

```bash
aws sts get-caller-identity
```

Verify region:

```bash
aws configure get region
```

Expected:

```text
ap-south-1
```

> ⚠️ Never commit AWS access keys or secret keys to GitHub.

---

# 📥 Step 2: Clone the Repository

Clone the project:

```bash
git clone https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master.git
```

Navigate into the project:

```bash
cd Microservices-E-Commerce-eks-project-master
```

Check the files:

```bash
ls
```

---

# 🪣 Step 3: Create S3 Infrastructure

Navigate to:

```bash
cd s3-buckets
```

Initialize Terraform:

```bash
terraform init
```

Create a Terraform plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply -auto-approve
```

Verify S3 buckets:

```bash
aws s3 ls
```

---

# 🖥️ Step 4: Create EC2 Jumphost

Navigate back:

```bash
cd ../terraform_main_ec2
```

Initialize Terraform:

```bash
terraform init
```

Create the plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply -auto-approve
```

Check Terraform resources:

```bash
terraform state list
```

Terraform creates the required EC2/Jumphost infrastructure used for the DevOps environment.

---

# 🔧 Step 5: Connect to the EC2 Jumphost

Connect to the EC2 instance through AWS EC2 Connect or SSH.

Switch to root:

```bash
sudo -i
```

Verify installed tools:

```bash
git --version
java -version
jenkins --version
terraform -version
mvn -v
kubectl version --client
eksctl version
helm version --short
docker --version
trivy --version
```

---

# 🔑 Step 6: Configure Jenkins

Get the Jenkins initial administrator password:

```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```

Open Jenkins:

```text
http://<EC2-PUBLIC-IP>:8080
```

Complete the initial Jenkins setup.

Recommended steps:

1. Enter the initial administrator password.
2. Install suggested plugins.
3. Create Jenkins administrator.
4. Save configuration.
5. Start Jenkins.

---

# 🔌 Step 7: Install Jenkins Plugins

Navigate to:

```text
Jenkins
→ Manage Jenkins
→ Plugins
→ Available Plugins
```

Install:

```text
Pipeline: Stage View
```

Restart Jenkins if required.

---

# ☸️ Step 8: Create EKS Cluster Using Jenkins

Create a Jenkins Pipeline job:

```text
Name:
eks-terraform
```

Select:

```text
Pipeline
```

Configure:

```text
Definition:
Pipeline script from SCM

SCM:
Git

Repository:
https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master.git

Branch:
*/main

Script Path:
eks-terraform/eks-jenkinsfile
```

> If your repository's Jenkins configuration uses `master` instead of `main`, use the branch actually present in your repository.

Build the pipeline.

If the pipeline provides Terraform action parameters:

```text
Terraform action:
apply
```

---

# 🔍 Step 9: Verify EKS

After the Jenkins pipeline completes:

```bash
aws eks --region ap-south-1 update-kubeconfig \
  --name project-eks
```

Check nodes:

```bash
kubectl get nodes
```

Check cluster information:

```bash
kubectl cluster-info
```

---

# 📦 Step 10: Create Amazon ECR Repositories

Create another Jenkins pipeline:

```text
Name:
ecr-terraform
```

Configure:

```text
Definition:
Pipeline script from SCM

SCM:
Git

Repository:
https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master.git

Branch:
*/main

Script Path:
ecr-terraform/ecr-jenkinfile
```

Run:

```text
Terraform action:
apply
```

---

# 🔍 Step 11: Verify Amazon ECR

Run:

```bash
aws ecr describe-repositories --region ap-south-1
```

List images:

```bash
aws ecr list-images \
  --repository-name frontend \
  --region ap-south-1
```

---

# 🔐 Step 12: Configure GitHub Credentials in Jenkins

Navigate to:

```text
Jenkins
→ Manage Jenkins
→ Credentials
→ Global
→ Add Credentials
```

Select:

```text
Kind:
Secret text
```

Use your own GitHub Personal Access Token:

```text
Secret:
<YOUR_GITHUB_PAT>
```

Set:

```text
ID:
my-git-pattoken
```

Description:

```text
GitHub credentials
```

Click **OK**.

> ⚠️ Never put your GitHub PAT inside this README, Jenkinsfile, Dockerfile, or source code.

---

# 🐳 Step 13: Build and Push Docker Images

Create Jenkins pipelines for the individual services.

## Email Service

```text
Job:
emailservice

Jenkinsfile:
jenkinsfiles/emailservice
```

## Checkout Service

```text
Job:
checkoutservice

Jenkinsfile:
jenkinsfiles/checkoutservice
```

## Recommendation Service

```text
Job:
recommendationservice

Jenkinsfile:
jenkinsfiles/recommendationservice
```

## Frontend

```text
Job:
frontend

Jenkinsfile:
jenkinsfiles/frontend
```

## Payment Service

```text
Job:
paymentservice

Jenkinsfile:
jenkinsfiles/paymentservice
```

## Product Catalog Service

```text
Job:
productcatalogservice

Jenkinsfile:
jenkinsfiles/productcatalogservice
```

## Cart Service

```text
Job:
cartservice

Jenkinsfile:
jenkinsfiles/cartservice
```

## Load Generator

```text
Job:
loadgenerator

Jenkinsfile:
jenkinsfiles/loadgenerator
```

## Currency Service

```text
Job:
currencyservice

Jenkinsfile:
jenkinsfiles/currencyservice
```

## Shipping Service

```text
Job:
shippingservice

Jenkinsfile:
jenkinsfiles/shippingservice
```

## Ad Service

```text
Job:
adservice

Jenkinsfile:
jenkinsfiles/adservice
```

Each Jenkins pipeline should build the corresponding Docker image and push it to Amazon ECR.

---

# 🛡️ Step 14: Container Security Scanning

Trivy can be used to scan container images.

Example:

```bash
trivy image <ECR-IMAGE>
```

Example:

```bash
trivy image \
090587344627.dkr.ecr.ap-south-1.amazonaws.com/frontend:latest
```

Replace the AWS account ID and repository name with your own values.

---

# 🚀 Step 15: Install Argo CD

Create the namespace:

```bash
kubectl create namespace argocd
```

Install Argo CD:

```bash
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verify:

```bash
kubectl get pods -n argocd
```

Wait until the Argo CD components are running.

---

# 🔍 Step 16: Verify Argo CD

```bash
kubectl get all -n argocd
```

Check:

```bash
kubectl get pods -n argocd
```

Expected components include:

```text
argocd-application-controller
argocd-applicationset-controller
argocd-dex-server
argocd-notifications-controller
argocd-redis
argocd-repo-server
argocd-server
```

---

# 🌐 Step 17: Expose Argo CD

Edit the Argo CD service:

```bash
kubectl edit svc argocd-server -n argocd
```

Change:

```yaml
type: ClusterIP
```

to:

```yaml
type: LoadBalancer
```

Save the configuration.

Check:

```bash
kubectl get svc argocd-server -n argocd
```

Copy the `EXTERNAL-IP` / AWS load balancer hostname.

---

# 🔑 Step 18: Get Argo CD Password

Run:

```bash
kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d && echo
```

Login:

```text
Username:
admin

Password:
<OUTPUT-FROM-COMMAND>
```

---

# 📁 Step 19: Create Application Namespace

Create:

```bash
kubectl create namespace dev
```

Verify:

```bash
kubectl get namespaces
```

---

# 🔄 Step 20: Deploy Application Using Argo CD

Open the Argo CD UI.

Select:

```text
+ NEW APP
```

Configure:

### Application Name

```text
project
```

### Project

```text
default
```

### Sync Policy

```text
Automatic
```

### Repository

```text
https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master.git
```

### Revision

```text
HEAD
```

### Path

```text
kubernetes-files
```

### Cluster URL

```text
https://kubernetes.default.svc
```

### Namespace

```text
dev
```

Click:

```text
Create
```

Argo CD will synchronize the Kubernetes manifests with the EKS cluster.

---

# ☸️ Step 21: Verify Application Deployment

Check pods:

```bash
kubectl get pods -n dev
```

Check services:

```bash
kubectl get svc -n dev
```

Check deployments:

```bash
kubectl get deployments -n dev
```

Check all resources:

```bash
kubectl get all -n dev
```

---

# 🌍 Step 22: Get Frontend Load Balancer

Run:

```bash
kubectl get svc -n dev
```

Find the frontend service.

Example:

```text
frontend   LoadBalancer   <CLUSTER-IP>   <AWS-LOAD-BALANCER-DNS>
```

Copy the external load balancer hostname.

---

# 🌐 Step 23: Configure Route 53

Create a public hosted zone in Amazon Route 53.

Example:

```text
yourdomain.com
```

If your domain is registered with another provider, update the domain's nameservers using the four nameservers provided by Route 53.

Use the actual nameservers assigned to your hosted zone.

---

# 🔒 Step 24: Configure AWS Certificate Manager

Open:

```text
AWS Certificate Manager
```

Choose:

```text
Request a public certificate
```

Enter:

```text
yourdomain.com
```

Optionally:

```text
www.yourdomain.com
```

Select:

```text
DNS Validation
```

Create the required DNS validation record in Route 53.

Wait for:

```text
Status: Issued
```

---

# 🔐 Step 25: Configure HTTPS

Configure the application's load balancer with an HTTPS listener.

Use:

```text
Protocol:
HTTPS

Port:
443
```

Select the ACM certificate associated with your domain.

Configure the listener to forward traffic to the appropriate application target.

---

# 🛡️ Step 26: Configure Security Group

Allow HTTPS:

```text
Type: HTTPS
Protocol: TCP
Port: 443
Source: 0.0.0.0/0
```

HTTP port `80` may also be configured if required for HTTP-to-HTTPS redirection or testing.

---

# 🌎 Step 27: Configure Route 53 DNS Record

Go to:

```text
Route 53
→ Hosted Zones
→ yourdomain.com
```

Create:

```text
Record Type:
A
```

Enable:

```text
Alias:
Yes
```

Select the appropriate AWS Load Balancer as the alias target.

Save the record.

---

# 🧪 Step 28: Test the Application

Open:

```text
https://yourdomain.com
```

The frontend should be accessible through HTTPS.

Test using curl:

```bash
curl -v https://yourdomain.com
```

---

# 🔍 Troubleshooting

## Check Kubernetes Pods

```bash
kubectl get pods -n dev
```

## Check Pod Logs

```bash
kubectl logs <POD-NAME> -n dev
```

## Describe Pod

```bash
kubectl describe pod <POD-NAME> -n dev
```

## Check Services

```bash
kubectl get svc -n dev
```

## Check Deployments

```bash
kubectl get deployments -n dev
```

## Check Events

```bash
kubectl get events -n dev \
  --sort-by=.metadata.creationTimestamp
```

---

# 🔍 Argo CD Troubleshooting

Check Argo CD:

```bash
kubectl get pods -n argocd
```

Check services:

```bash
kubectl get svc -n argocd
```

Check applications:

```bash
kubectl get applications -n argocd
```

Describe the application:

```bash
kubectl describe application project -n argocd
```

---

# ☸️ EKS Troubleshooting

Check nodes:

```bash
kubectl get nodes
```

Check cluster:

```bash
kubectl cluster-info
```

Update kubeconfig:

```bash
aws eks update-kubeconfig \
  --name project-eks \
  --region ap-south-1
```

Verify AWS identity:

```bash
aws sts get-caller-identity
```

---

# 📦 ECR Troubleshooting

List repositories:

```bash
aws ecr describe-repositories \
  --region ap-south-1
```

List images:

```bash
aws ecr list-images \
  --repository-name frontend \
  --region ap-south-1
```

---

# 🔐 Security Best Practices

Never commit the following files or values to GitHub:

```text
AWS Access Keys
AWS Secret Keys
GitHub Personal Access Tokens
SSH Private Keys
Jenkins Passwords
Argo CD Passwords
Database Passwords
.env files containing secrets
```

Use secure secret-management mechanisms such as:

* Jenkins Credentials
* AWS IAM Roles
* AWS Secrets Manager
* Kubernetes Secrets
* GitHub Secrets

---

# 📊 Project Workflow

```text
                    GitHub
                       │
                       ▼
                   Jenkins
                       │
             ┌─────────┴─────────┐
             │                   │
          Build/Test          Trivy
             │                   │
             └─────────┬─────────┘
                       │
                       ▼
                  Docker Build
                       │
                       ▼
                    Amazon ECR
                       │
                       ▼
                    Argo CD
                       │
                       ▼
                   Amazon EKS
                       │
              ┌────────┴────────┐
              │                 │
        Kubernetes Pods    Kubernetes Services
              │                 │
              └────────┬────────┘
                       │
                       ▼
                AWS Load Balancer
                       │
                       ▼
                   Route 53
                       │
                       ▼
                     ACM
                       │
                       ▼
                    HTTPS
                       │
                       ▼
                    Users
```

---

# 🎯 Project Objectives

This project demonstrates the following DevOps capabilities:

* AWS cloud infrastructure provisioning
* Infrastructure as Code using Terraform
* Kubernetes cluster management using Amazon EKS
* Docker containerization
* Amazon ECR image management
* Jenkins CI/CD automation
* GitOps deployment using Argo CD
* Kubernetes workload deployment
* AWS Load Balancer configuration
* Route 53 DNS management
* HTTPS configuration using ACM
* Container security scanning using Trivy
* Linux and AWS CLI administration
* Microservices deployment and orchestration

---

# 💼 Resume Project Description

### Microservices E-Commerce Platform on Amazon EKS

**Technologies:** AWS, EKS, ECR, EC2, Terraform, Docker, Kubernetes, Jenkins, Argo CD, Route 53, ACM, Trivy, GitHub

* Deployed a containerized microservices e-commerce application on **Amazon EKS** using Kubernetes.
* Automated AWS infrastructure provisioning using **Terraform**, including EKS, ECR, EC2, networking, and supporting resources.
* Implemented **Jenkins CI/CD pipelines** to build, scan, tag, and push Docker images to **Amazon ECR**.
* Implemented **GitOps-based application deployment using Argo CD**, synchronizing Kubernetes manifests from GitHub to EKS.
* Configured Kubernetes services and AWS Load Balancers to expose application workloads.
* Configured **Route 53 and AWS Certificate Manager** for DNS management and HTTPS-based application access.
* Used **Trivy** for container image vulnerability scanning as part of the DevSecOps workflow.

---

# 🧠 Skills Demonstrated

```text
AWS
Amazon EKS
Amazon ECR
Amazon EC2
IAM
VPC
S3
Route 53
AWS ACM
Terraform
Docker
Kubernetes
Jenkins
Argo CD
GitOps
Helm
Git
GitHub
Linux
AWS CLI
kubectl
eksctl
Trivy
CI/CD
DevOps
DevSecOps
Infrastructure as Code
Microservices
Containerization
```

---

# 📚 Key DevOps Concepts Demonstrated

### Infrastructure as Code

Terraform is used to provision and manage AWS infrastructure.

### Continuous Integration

Jenkins automates application build and container-image workflows.

### Containerization

Docker packages each microservice into a portable container image.

### Container Registry

Amazon ECR stores the Docker images.

### Continuous Deployment

Argo CD synchronizes Kubernetes manifests from GitHub to EKS.

### Container Orchestration

Amazon EKS manages the Kubernetes workloads.

### GitOps

GitHub acts as the declarative source of truth for Kubernetes deployment manifests.

### Security

Trivy is used for container vulnerability scanning, while AWS IAM and security groups control access.

### HTTPS

AWS Certificate Manager provides the SSL/TLS certificate used for secure application traffic.

---

# 🏆 Final Deployment

The final platform follows:

```text
GitHub
   ↓
Jenkins
   ↓
Docker
   ↓
Trivy
   ↓
Amazon ECR
   ↓
Argo CD
   ↓
Amazon EKS
   ↓
Kubernetes
   ↓
AWS Load Balancer
   ↓
Route 53
   ↓
AWS Certificate Manager
   ↓
HTTPS
   ↓
E-Commerce Application
```

---

# 👨‍💻 Author

**Shashanka S**

Cloud & DevOps Enthusiast

**AWS | Kubernetes | Docker | Terraform | Jenkins | Argo CD | GitOps**

---

## ⭐ Repository

**GitHub Repository:**
https://github.com/Shashanka2911/Microservices-E-Commerce-eks-project-master

