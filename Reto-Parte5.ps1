# Utilizando Azure CLI o PowerShell, crea un Application Registration en Entra ID. Asocia permisos adecuados a este para permitir que una Azure Function acceda a un recurso específico (como un Key Vault o una base de datos). Muestra cómo agregar roles o asignar permisos de manera programática utilizando CLI o PowerShell.
#Creo el application registration. Doy permiso de sign in a microsoft account ya que eso es lo que estoy usando
$appRegistration = (az ad app create --display-name "AzureFunctionAppRegistration" --sign-in-audience AzureADandPersonalMicrosoftAccount)
