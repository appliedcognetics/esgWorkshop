# Website Install
 
## Cloud Shell on Azure
1. Go to the cloud shell on Azure , locat the icon in the Azure Portal or go to [shell.azure.com](shell.azure.com).
1. Run the following Power Shell Commands (make sure to switch to Powershell )
```
Install-Module Az
Install-Module Az.ServiceBus
Install-Module Az.Search
```
3. Copy applicationUI.zip to the **cloudshell** home directory 
* The 
4. unzip the applicationUI.zip ```unzip applicationUI.zip```
5. Edit ```code ms-poc-sdg-infra-deploy.ps1```
    Enter the key and connection string 
    * $prefix = **Enter a Prefix Name for the services**
    * $resourceGroupName = **Name of your resource group**
    * $location = **Location of your resource group**
    * $languagestudio_projectdeployURL = **From Language Service**
    * $languagestudio_azureAPIKey  = **From Language Service**
    * $languagestudio_projectname = **From Language Service**
    * $languagestudio_deploymentName = **From Language Service**
    * $sql_connectionstring = **From SQL Database**
![SQlconnect](../images/websitesetup/website_sqlconnectionstring.jpg)

## Train the model


Create and app registration 


## Setup the Database
* Follow the Instructions for setting up the database
## WebSite Setup
* Ensure the 
    Install-Module Az
    Install-Module Az.ServiceBus
    Install-Module Az.Search
* Copy the main zip file from the repo
* Unzip the File


Fix the 

Get the documentation

## Swagger Page Backend API
https://prefix212sdg-backend-api.azurewebsites.net/Emtec.Cognitive.Search.Api/swagger/index.html

https://prefix212sdg-ui.azurewebsites.net


Configure Redirect URL in app registration 
>> Authentication >> Add Platform >> Single Page Application 
https://prefix212sdg-ui.azurewebsites.net/login

Add User go to active directory

esg-test-app | Users and groups
Enterprise Application








