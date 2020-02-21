. ./.env.sh

clientApplicationId=$(az ad app create \
    --display-name "${aksname}Client" \
    --native-app \
    --reply-urls "https://${aksname}Client" \
    --query appId -o tsv)
    
az aks create --resource-group $OH_AKS_RG \
--name 
