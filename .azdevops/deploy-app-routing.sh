. .azdevops/.env.sh

az aks enable-addons --resource-group $OH_AKS_RG --name $OH_AKS_NAME --addons http_application_routing

az aks show --resource-group $OH_AKS_RG --name $OH_AKS_NAME --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table