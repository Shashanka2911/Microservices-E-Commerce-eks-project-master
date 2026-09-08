# ==========================================
# ArgoCD
# ==========================================
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# ==========================================
# Grafana & Prometheus
# ==========================================
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# FIX: Namespace must be lowercase
kubectl create namespace prometheus --dry-run=client -o yaml | kubectl apply -f -

# FIX: Changed release name from 'stable' to 'prometheus' for clarity
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack -n prometheus

# ==========================================
# AWS EBS CSI Driver
# ==========================================
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update

helm upgrade --install aws-ebs-csi-driver --namespace kube-system aws-ebs-csi-driver/aws-ebs-csi-driver