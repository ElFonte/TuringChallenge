#Crear un key vault. Utilizando Managed Identity, permite que el app service acceda al key vault
#Parametros comunes, los definimos en variables
$location="spain central"
$resourceGroup="turing"
$keyVaultName="kv-turing"
$AppServicePlanIdentity = "identity-keyvault"
$webAppName="challenge-turing"

#No hemos utilizado ninguna instancia de key vault en nuestra subscripcion. Vamos a registrar el servicio
az provider register --namespace Microsoft.Keyvault
#Creamos el key vault
az keyvault create --name $keyVaultName --resource-group $resourceGroup --location $location --sku standard
#Creamos un nuevo identity
az identity create --name $AppServicePlanIdentity --resource-group $resourceGroup --location $location
#Obtenemos el Principal ID de la identidad
$identityPrincipalId=az identity show --name $AppServicePlanIdentity --resource-group $resourceGroup --query principalId --output tsv
#Asignamos el managed identity al web app
az webapp identity assign --name $webAppName --resource-group $resourceGroup
#Damos acceso al key vault para le ID de la web app
az role assignment create --role "Key Vault Administrator" --assignee $identityPrincipalId --scope $keyVaultId
#Necesitamos asignar un rol que permita al usuario actual crear secrets. Obtengo el id del usuario actual y el ID del keyvault
$userID = az ad signed-in-user show --query id --output tsv
$keyVaultId = az keyvault show --name $keyVaultName --query id --output tsv
#Asignamos el rol al usuario actual. Deberia ser un rol de Key Vault Secrets Officer, pero para simplicidad de esta demo asignamos Key Vault Administrator
az role assignment create --role "Key Vault Administrator" --assignee $userId --scope $keyVaultId
#Creamos 2 secretos en el key vault
az keyvault secret set --vault-name $keyVaultName --name "Secreto1" --value "password1"
az keyvault secret set --vault-name $keyVaultName --name "Secreto2" --value "password2"


