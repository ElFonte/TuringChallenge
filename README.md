# TuringChallenge
Reto tecnico para Turing Challenge
Hola Marco y Javier
Aqui encontraran todo el contenido para del reto

Prueba técnica
1. Azure Functions:
Crea una Azure Function y un Blob Storage Account desde el portal de Azure.
Configura adecuadamente los permisos, asegurando que la Function tenga acceso de lectura y escritura al Blob Storage a través de Azure Managed Identity.
2. App Services y Azure CLI:
Despliega un App Service utilizando Azure CLI.
3. Key Vault y Gestión de Secretos:
Crea un Azure Key Vault y almacena dos secretos en él.
Asegúrate de que el App Service anterior tenga los permisos adecuados para acceder al Key Vault, utilizando Azure Managed Identity.
4. Service Bus:
Crea un Azure Service Bus y una cola en este.
Asegúrate de que la Function anterior tenga los permisos adecuados para recibir y enviar mensajes, utilizando Azure Managed Identity.
5. Entra ID y Gestión de Permisos:
Utilizando Azure CLI o PowerShell, crea un Application Registration en Entra ID.
Asocia permisos adecuados a este para permitir que una Azure Function acceda a un recurso específico (como un Key Vault o una base de datos).
Muestra cómo agregar roles o asignar permisos de manera programática utilizando CLI o PowerShell.
6. Opcional (AKS y Azure ML):
Si tienes experiencia con AKS (Azure Kubernetes Service), explica cómo listar los nodos/deployments y pods.
Si tienes experiencia con Azure Machine Learning, describe cómo utilizarías esta plataforma para consumir un modelo ya registrado.
