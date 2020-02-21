. .azdevops/.env.sh

# Create a namespace for your ingress resources
kubectl create namespace $OH_AKS_INGRESS_NAMESPACE

# Add the official stable repository
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Use Helm to deploy an NGINX ingress controller
helm install nginx-ingress stable/nginx-ingress \
    --namespace $OH_AKS_INGRESS_NAMESPACE \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux

