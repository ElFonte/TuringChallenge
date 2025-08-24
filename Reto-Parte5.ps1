# Utilizando Azure CLI o PowerShell, crea un Application Registration en Entra ID. Asocia permisos adecuados a este para permitir que una Azure Function acceda a un recurso específico (como un Key Vault o una base de datos). Muestra cómo agregar roles o asignar permisos de manera programática utilizando CLI o PowerShell.
#Creo el application registration. Guardo la respuesta porque ahi trae los parametros que necesito para los siguientes pasos. Utilizaria un certificado de salida pero excede los requisitos de este ejercicio
$resourceGroup="turing"
$PrincipalName = "sp-functionapp"
$keyVaultName = "kv-turing"
$subID = az account show --query id --output tsv
$response = @(az ad sp create-for-rbac -n $PrincipalName --role Contributor --scopes /subscriptions/$SubID/resourceGroups/$resourceGroup/providers/Microsoft.KeyVault/vaults/$keyVaultName)
#Convierto la respuesta a variable Json para comodidad de uso. Se puede guardar en otro lado para referencias futuras
$responseJson = $response | ConvertFrom-Json
#Asi lo creamos como Contributor. Vamos a darle permiso Reader sobre el resource group como ejemplo de como asignar un rol
az role assignment create --assignee $responseJson.appId --role Reader --scope /subscriptions/$SubID/resourceGroups/$resourceGroup
