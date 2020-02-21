az aks get-credentials --resource-group myResourceGroup --name $aksname --overwrite-existing

kubectl get pods --all-namespaces