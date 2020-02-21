. ./.env.sh

# Get the resource ID of your AKS cluster
AKS_CLUSTER=$(az aks show --resource-group $OH_AKS_RG --name $OH_AKS_NAME --query id -o tsv)

# Get the account credentials for the logged in user
ACCOUNT_UPN=$(az account show --query user.name -o tsv)
ACCOUNT_ID=$(az ad user show --id $ACCOUNT_UPN --query objectId -o tsv)

# Assign the 'Cluster Admin' role to the user
az role assignment create \
    --assignee $ACCOUNT_ID \
    --scope $AKS_CLUSTER \
    --role "Azure Kubernetes Service Cluster Admin Role"

# ➜  .azdevops git:(jonescobedo/tripviewer) ✗ ./test-cluster-permissions.sh         
# {
#   "canDelegate": null,
#   "id": "/subscriptions/1b6a0f9d-fe70-4fb5-ae24-5b615270aebe/resourcegroups/openhack-containers/providers/Microsoft.ContainerService/managedClusters/openhackcluster/providers/Microsoft.Authorization/roleAssignments/45564d52-d201-473c-9efc-a0c01c9b6114",
#   "name": "45564d52-d201-473c-9efc-a0c01c9b6114",
#   "principalId": "b9b34ded-ff3a-4518-84df-6246c35da380",
#   "principalType": "User",
#   "resourceGroup": "openhack-containers",
#   "roleDefinitionId": "/subscriptions/1b6a0f9d-fe70-4fb5-ae24-5b615270aebe/providers/Microsoft.Authorization/roleDefinitions/0ab0b1a8-8aac-4efd-b8c2-3ee1fb270be8",
#   "scope": "/subscriptions/1b6a0f9d-fe70-4fb5-ae24-5b615270aebe/resourcegroups/openhack-containers/providers/Microsoft.ContainerService/managedClusters/openhackcluster",
#   "type": "Microsoft.Authorization/roleAssignments"
# }

