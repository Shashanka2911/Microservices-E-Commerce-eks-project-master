#!/bin/bash
set -e

echo "=========================================="
echo " DevOps EC2 Setup Started (Ubuntu/Debian)"
echo "=========================================="

# 1. ADD SWAP MEMORY (CRITICAL FOR T3.MICRO)
echo "Configuring 4GB Swap Memory..."
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10

# 2. Update system and basic tools
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y
sudo apt-get install -y git wget curl unzip tar gzip jq software-properties-common apt-transport-https ca-certificates gnupg lsb-release

# 3. Java 21 (UPDATED FOR NEW JENKINS REQUIREMENT)
sudo apt-get install -y openjdk-21-jdk

# 4. Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# 5. Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 6. Terraform & Vault
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y
sudo apt-get install -y terraform vault

# 7. Maven & Ansible
sudo apt-get install -y maven ansible

# 8. kubectl
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -m 0755 kubectl /usr/local/bin/kubectl
rm -f kubectl

# 9. eksctl
PLATFORM="$(uname -s)_amd64"
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp && rm eksctl_${PLATFORM}.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin/eksctl

# 10. Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# 11. Docker
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins

# 12. Docker Compose
DOCKER_COMPOSE_VERSION="v2.24.5"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 13. SonarQube Requirements
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w fs.file-max=65536
echo "vm.max_map_count=262144" | sudo tee /etc/sysctl.d/99-sonarqube.conf
echo "fs.file-max=65536" | sudo tee -a /etc/sysctl.d/99-sonarqube.conf
sudo sysctl --system

# 14. SonarQube (Docker)
sudo docker run -d --name sonar --restart unless-stopped -p 9000:9000 sonarqube:lts-community

# 15. Trivy
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install -y trivy

# 16. MariaDB & PostgreSQL
sudo apt-get install -y mariadb-server postgresql postgresql-contrib
sudo systemctl enable mariadb postgresql
sudo systemctl start mariadb postgresql

# 17. AWS CLI v2
curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -q /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install --update
rm -rf /tmp/aws /tmp/awscliv2.zip

# 18. Kubernetes/ArgoCD/Prometheus Logic
if kubectl cluster-info >/dev/null 2>&1; then
    echo "Kubernetes cluster detected. Installing ArgoCD and Prometheus..."
    
    # ArgoCD
    kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
    kubectl apply --server-side --force-conflicts -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    
    # Prometheus
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update
    kubectl create namespace prometheus --dry-run=client -o yaml | kubectl apply -f -
    helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --namespace prometheus
else
    echo "No Kubernetes cluster configured locally. Skipping Argo CD and Prometheus installation."
fi

echo "=========================================="
echo " Setup Completed"
echo "=========================================="