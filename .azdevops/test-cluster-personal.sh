. ./.env.sh

az aks get-credentials --resource-group $OH_AKS_RG --name $aksname --overwrite-existing

kubectl config view

