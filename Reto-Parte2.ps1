#Despliega un App Service utilizando Azure CLI. Entiendo que esto se refiere a un web app, ya que no tiene sentido el resto de los puntos si se trata solo del plan. Esto es solo un recurso de soporte para una function app o una web app, y como tal no puede tener identity como se solicita mas adelante
#Partimos de la premisa de que tenemos una subscripcion creada, estamos logueados en Azure (az login) y contamos con suficientes permisos. Queremos operar sobre el mismo resource group creado en el paso 1
#Parametros comunes, los definimos en variables
$location="spain central"
$resourceGroup = "turing"
$appServicePlan = "asp-turing-cli"
$webAppName="challenge-turing"
$runtime="PYTHON:3.12"

#Creamos el app service
az appservice plan create --name $appServicePlan --resource-group $resourceGroup --location $location --sku B1 --is-linux
#Creamos una web app sobre este service plan
az webapp create --name $webAppName --resource-group $resourceGroup --plan $appServicePlan --runtime $runtime
#Creamos el app service. Desplegamos un hello world desde github como ejemplo
az webapp deployment source config --name $webAppName --resource-group $resourceGroup --repo-url https://github.com/Azure-Samples/python-docs-hello-world --branch master --manual-integration