. .azdevops/.env.sh


CLUSTER_RESOURCE_GROUP=$(az aks show --resource-group $OH_AKS_RG --name $aksname --query nodeResourceGroup -o tsv)
SCALE_SET_NAME=$(az vmss list --resource-group $OH_AKS_RG --query [0].name -o tsv)


az vmss extension set  \
    --resource-group $CLUSTER_RESOURCE_GROUP \
    --vmss-name $SCALE_SET_NAME \
    --name VMAccessForLinux \
    --publisher Microsoft.OSTCExtensions \
    --version 1.4 \
    --protected-settings "{\"username\":\"azureuser\", \"ssh_key\":\"$(cat ~/.ssh/id_rsa.pub)\"}"

az vmss update-instances --instance-ids '*' \
    --resource-group $CLUSTER_RESOURCE_GROUP \
    --name $SCALE_SET_NAME

CLUSTER_RESOURCE_GROUP=$(az aks show --resource-group $OH_AKS_RG --name $aksname --query nodeResourceGroup -o tsv)
az vm list --resource-group $CLUSTER_RESOURCE_GROUP -o table