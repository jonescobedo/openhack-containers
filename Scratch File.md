Scratch File

******* Challenge One ********

docker run --network <networkname> -e SQLFQDN=sqlserverzlh9820.database.windows.net -e SQLUSER=<db-user> -e SQLPASS=<password> -e SQLDB=mydrivingDB openhack/data-load:v1

Azure SQL FDQN: sqlserverzlh9820.database.windows.net
Azure SQL Server User: sqladminzLh9820
Azure SQL Server Pass: xF0ks4Du4
Azure SQL Server Database: mydrivingDB

docker run -d -p 8080:80 --name poi --network azdevops_default -e "SQL_USER=sqladminzLh9820" -e "SQL_PASSWORD=xF0ks4Du4" -e "SQL_SERVER=sqlserverzlh9820.database.windows.net" -e "SQLDBN=mydrivingDB" -e "ASPNETCORE_ENVIRONMENT=local" tripinsights/poi:1.0



docker run -d -p 8080:80 --name poi --network azdevops_default -e "SQL_USER=SA" -e "SQL_PASSWORD=P@ssw0rd1" -e "SQL_SERVER=sql1" -e "SQLDBN=mydrivingDB" -e "ASPNETCORE_ENVIRONMENT=Local" tripinsights/poi:1.0

docker run --name dataload --network azdevops_default v -e SQLFQDN=sql1 -e SQLUSER=SA -e SQLPASS=P@ssw0rd1 -e SQLDB=mydrivingDB openhack/data-load:v1

docker run --network azdevops_default -e "ACCEPT_EULA=Y" -e "SQLFQDN=sql1" -e "SQLUSER=SA" -e "SQLPASS=P@ssw0rd1" -e "SQLDB=mydrivingDB" openhack/data-load:v1
 
sudo docker run --network azdevops_default -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" -p 1433:1433 --name sql1 -d mcr.microsoft.com/mssql/server:2017-latest

curl -i -X GET 'http://10.0.3.233:80/api/poi' 


******* CHALLENGE TWO ********

az group create --location eastus \
        --name openhack-containers \
        --subscription OTA-PRD-181

az aks create --resource-group openhack-containers \
        --name aks-cluster \
        --location eastus \
        --generate-ssh-keys \
        --vm-set-type VirtualMachineScaleSets \
        --enable-cluster-autoscaler \
        --min-count 1 \
        --max-count 3 \
        --load-balancer-sku basic 

az aks get-credentials --resource-group openhack-containers --name openhackcluster       

az aks update -n openhackcluster -g openhack-containers --attach-acr registryzlh9820.azurecr.io

******** CHALLENGE THREE ********

 $ az network vnet subnet list \
    --resource-group teamResources \
    --vnet-name vnet \
    --query "[0].id" --output tsv

/subscriptions/<guid>/resourceGroups/myVnet/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/default


# Get the resource ID of your AKS cluster
AKS_CLUSTER=$(az aks show --resource-group openhack-containers --name openhackcluster --query id -o tsv)

# Get the account credentials for the logged in user
ACCOUNT_UPN=$(az account show --query user.name -o tsv)
ACCOUNT_ID=$(az ad user show --id $ACCOUNT_UPN --query objectId -o tsv)
GROUP_ID=$(az ad group show --group AKSAdmin --query objectId -o tsv)

# Assign the 'Cluster Admin' role to the user
az role assignment create \
    --assignee $GROUP_ID \
    --scope $AKS_CLUSTER \
    --role "Azure Kubernetes Service Cluster Admin Role"

    c

az aks get-credentials --resource-group openhack-containers --name openhackcluster --overwrite-existing

kubectl exec -it poi-7bd8b95f95-zfxgm -- /bin/bash

