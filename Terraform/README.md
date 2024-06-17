az acr login --name crdnazareno
docker tag dboffelli/concert-app:1.0  crdnazareno.azurecr.io/concert-app:1.0
docker push crdnazareno.azurecr.io/concert-app:1.0


az aks get-credentials --resource-group rg-dnazareno-dvfinlab --name dnazareno-aks
az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)


kubectl create secret docker-registry regcred --docker-server=crdnazareno.azurecr.io --docker-username=$(terraform output -raw cr_admin_username) --docker-password=$(terraform output -raw cr_admin_password)