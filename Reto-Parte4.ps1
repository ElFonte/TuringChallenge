#Crear un service bus con una cola. Crea un managed identity que permita leer y escribir mensajes a la web app de la parte 2
#Parametros comunes, los definimos en variables
$location="spain central"
$resourceGroup="turing"
$webAppName="challenge-turing"
$serviceBusNamespace="sb-turing"
$queueName="turing-queue"
$managedIdentityName="identity-servicebus"
#No hemos utilizado ninguna instancia de service bus en nuestra subscripcion. Vamos a registrar el servicio
az provider register --namespace Microsoft.ServiceBus
#Creamos el service bus
az servicebus namespace create --resource-group $resourceGroup --name $serviceBusNamespace --location $location --sku Standard
#Creamos la cola en el service bus
az servicebus queue create --resource-group $resourceGroup --namespace-name $serviceBusNamespace --name $queueName
#Creamos un nuevo identity
az identity create --name $managedIdentityName --resource-group $resourceGroup --location $location
#Obtenemos el Principal ID y el Identity ID
$identityPrincipalId= (az identity show --name $managedIdentityName --resource-group $resourceGroup --query principalId --output tsv)
$identityId=(az identity show --name $managedIdentityName --resource-group $resourceGroup --query id --output tsv)
#Asignamos el Identity ID al app service del paso 2
az webapp identity assign --name $webAppName --resource-group $resourceGroup --identities $identityId
#Asignamos el permiso de escritura sobre el service bus
az role assignment create --assignee $identityPrincipalId --role "Azure Service Bus Data Sender" --scope "/subscriptions/$(az account show --query id -o tsv)/resourceGroups/$resourceGroup/providers/Microsoft.ServiceBus/namespaces/$serviceBusNamespace"
#Asignamos el permiso de lectura sobre el service bus
az role assignment create --assignee $identityPrincipalId --role "Azure Service Bus Data Receiver" --scope "/subscriptions/$(az account show --query id -o tsv)/resourceGroups/$resourceGroup/providers/Microsoft.ServiceBus/namespaces/$serviceBusNamespace"
