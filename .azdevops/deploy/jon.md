. ../.azdevops/.env.sh

# modify exec permissions over folder
chmod +x .azdevops/* 

## get gredentials for local k8s
az aks get-credentials --resource-group $OH_AKS_RG --name $aksname --admin

## You can use the container registry cli for azure:
az acr repository list --name $OH_ACR_NAME --output table

## create port forwarding
kubectl port-forward pods/tripviewer-66856b95cb-gsffr 8080:80

## talk
https://github.com/vyta
https://github.com/mozilla/sops
https://github.com/thomasv314/kubernetes-home

## ping an internal vm
kubectl exec -it poi-7bd8b95f95-zfxgm ping internal-vm 

mailto:jstur@microsoft.com


## Success Criteria
<!-- 
Your team successfully deployed the TripInsights application into the cluster
Different members of your team must be able to connect to your cluster using the api-dev and web-dev AAD users and demonstrate appropriate access levels
Your team secured your Azure SQL Server connection information such that literal values cannot be inappropriately accessed
Your team used an external key vault to store and access secrets inside your cluster
Your team ensured that all links on the Trip Viewer site are reachable
Your team ensured the simulator can successfully update the values in the application across all services 
-->

<!-- 
namespace/ingress-basic created
"stable" has been added to your repositories
NAME: nginx-ingress
LAST DEPLOYED: Thu Feb 20 14:11:40 2020
NAMESPACE: ingress-basic
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The nginx-ingress controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace ingress-basic get services -o wide -w nginx-ingress-controller'

An example Ingress that makes use of the controller:

  apiVersion: extensions/v1beta1
  kind: Ingress
  metadata:
    annotations:
      kubernetes.io/ingress.class: nginx
    name: example
    namespace: foo
  spec:
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                serviceName: exampleService
                servicePort: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
        - hosts:
            - www.example.com
          secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls 
  -->

<!-- 

  kubectl 
  -A all
  -n (namespace)
  
  -->



  kubectl get secret gitlab-registry --namespace=revsys-com --export -o yaml |\
   kubectl apply --namespace=devspectrum-dev -f -


1 aks controllers - 2 ingress

sidecar - istion

ingress from one location

not service discovery on aks cluister

acr registry deployment 

extension monitoring -- ingress 
octane

--
until ingress controller


container to container communication

https://azure.microsoft.com/en-us/services/azure-arc/#pricing

<!-- 
Your team restricted access from the deployed services access to kube-apiserver
Your team limited the access to the Kubernetes API Server to only machines from your location
Your team demonstrated that the API applications cannot call each other
Your team restricted ability to deploy applications that have root access
Your team limited the egress traffic from the cluster
Your team enabled sql server access from inside the vnet only
Your team enabled KeyVault access without the need for a secret stored in the cluste

Your team successfully deployed the WCF application into the same AKS cluster as your Linux workloads
Your team ensured that previous deployments are unchanged and unaffected
Your team ensured that the updated Trip Viewer web app can successfully communicate with the WCF service
Your team must demonstrate your cluster is overall "Healthy" 
-->

<!-- 
# Install the aks-preview extension
az extension add --name aks-preview

# Update the extension to make sure you have the latest version installed
az extension update --name aks-preview
 -->


az aks update \
    --resource-group $OH_AKS_RG \
    --name $aksname \
    --enable-pod-security-policy

