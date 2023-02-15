<#

1. Language Studio (Manually)
2. Azure SQL Server & Database (Manually)
3. Storage Account
4. ServiceBus
5. Function App-Skillset (Dependencies : Storage Account, ServiceBus, Language Studio)
6. Azure Search
7. Function App-EventSubsriber (Dependencies: SQL, Storage Account, ServiceBus, Azure Search)
8. Web App-backend-api (Dependencies: SQL, Storage Account, Azure Search)
9. Web App-UI (Dependencies: backend-api, tenant)

#>

Write-Host "DEPLOYMENT STARTED"

Install-Module Az
Install-Module Az.ServiceBus
Install-Module Az.Search


Connect-AzAccount  #Enter the credentials to login
Set-AzContext -Subscription "*********Your Subscription**************"  #Select the Subscrption

#Set parameters
$prefix = "prefix1"
$resourceGroupName = "*********** Your RESOURCE GROUP *******************"
$location = "eastus" ## REGION FOR YOUR DEPLOYMENT 
$storageaccount_name = $prefix + "storagesdg"
$container_documents = "documents"
$servicebus_name = $prefix + "asb-sdg"
$servicebus_queue_name = "asb-sdg"
$functionapp_skillset_name = $prefix + "func-sdg-skillset"
$functionapp_eventsubscriber_name = $prefix + "func-sdg-event-subscriber"
$languagestudio_projectdeployURL = "********** LANGUAGE URL HERE *****************"
$languagestudio_azureAPIKey = "*********** LANGUAGE API KEY ******************"
$languagestudio_projectname = "*****PROJECT NAME ************"
$languagestudio_deploymentName = "******** DEPLOYMENT NAME ***************"
$searchservice_name = $prefix + "search-sdg"
$searchserviceSKU = "Standard" ### Free Or Standard
$sql_connectionstring = "**** SQL CONNECTION STRING **************"
$webapp_serviceplan = $prefix + "sdg-backend-api_sp"
$webapp_backendapi_name = $prefix + "sdg-backend-api"
$webapp_ui_name = $prefix + "sdg-ui"

#-------------------------------------------------------------------------------------------------------------------------

$functionapp_skillset_codepath = $PSScriptRoot + "/func-sdg-skillset.zip"
$functionapp_eventsubscriber_codepath = $PSScriptRoot + "/func-sdg-event-subscriber.zip"
$webapp_backendapi_codepath = $PSScriptRoot + "/ms-poc-sdg-api.zip"
$webapp_ui_codepath = $PSScriptRoot + "/ms-poc-sdg-ui.zip"

Write-Host $functionapp_skillset_codepath


#-------------------------------------------------------------------------------------------------------------------------
# Storage Account 
#-------------------------------------------------------------------------------------------------------------------------

Write-Host "Creating Storage Account '$storageaccount_name'....."

New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                    -Name $storageaccount_name `
                    -Location $location `
                    -SkuName Standard_LRS 

Write-Host "Storage Account '$storageaccount_name' created successfully"
    

# Retrieve Storage account endpoint
$storageaccount_accountkey = (Get-AzStorageAccountKey  -Name $storageaccount_name -ResourceGroupName $resourceGroupName).Value[0]
$storageaccount_endpoint = "DefaultEndpointsProtocol=https;AccountName=$storageaccount_name;AccountKey=$storageaccount_accountkey;"
Write-Host ($storageaccount_endpoint | Format-Table | Out-String)



#------- Storage Account - Container (for Documents)

$storagecontext = New-AzStorageContext -ConnectionString $storageaccount_endpoint

Write-Host "Creating Container '$container_documents'....."
New-AzStorageContainer -Name $container_documents `
                        -Context $storagecontext `
                        -Permission Off

Write-Host "Container '$container_documents' created successfully"


#-------------------------------------------------------------------------------------------------------------------------
# Service Bus (event for async updating database)
#-------------------------------------------------------------------------------------------------------------------------
Write-Host "Creating Service Bus '$servicebus_name'....."

New-AzServiceBusNamespace -Name $servicebus_name `
                          -ResourceGroupName $resourceGroupName `
                          -Location $location

Write-Host "Service Bus '$servicebus_name' created successfully"

$servicebus_primaryconnectionstring = (Get-AzServiceBusKey -ResourceGroupName $resourceGroupName -NamespaceName $servicebus_name -Name RootManageSharedAccessKey).PrimaryConnectionString



#-------------------------------------------------------------------------------------------------------------------------
# Function App - Custom Skillset (for azure search indexer)
#-------------------------------------------------------------------------------------------------------------------------

Write-Host "Creating Function App '$functionapp_skillset_name'....."

New-AzFunctionApp -Name $functionapp_skillset_name `
                    -ResourceGroupName $resourceGroupName `
                    -Location $location `
                    -StorageAccountName $storageaccount_name `
                    -Runtime DotNet `
                    -RuntimeVersion 6 `
                    -OSType Windows `
                    -FunctionsVersion 4 `
                    -IdentityType SystemAssigned `

Write-Host "Function App '$functionapp_skillset_name' created successfully"


#------- Function App - Skillset - Deploy Code
                    

Write-Host "Deploying Function App '$functionapp_skillset_name' code.."
Publish-AzWebapp -Name $functionapp_skillset_name `
                    -ResourceGroupName $resourceGroupName `
                    -ArchivePath $functionapp_skillset_codepath `
                    -Force

Write-Host "Function App '$functionapp_skillset_name' code deployed successfully"


#------- Function App - Skillset - Application Settings
 

#Configure Application Settings in Function App
Write-Host "Configuring Application Settings Function App '$functionapp_skillset_name'"

Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"ServiceBusConnectionString" = $servicebus_primaryconnectionstring }

Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"StorageConnectionString" = $storageaccount_endpoint }

Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"languageStudioProjectDeplyURL" = $languagestudio_projectdeployURL }

Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"languageStudioAzureAPIKey" = $languagestudio_azureAPIKey }
                            
Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"languageStudioProjectName" = $languagestudio_projectname }
                            
Update-AzFunctionAppSetting -Name $functionapp_skillset_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"deploymentName" = $languagestudio_deploymentName }

                            
Write-Host "Done: Configuring Application Settings Function App '$functionapp_skillset_name'"



#-------------------------------------------------------------------------------------------------------------------------
# Azure Search
#-------------------------------------------------------------------------------------------------------------------------
Write-Host "Creating Search Service '$searchservice_name'....."

New-AzSearchService -ResourceGroupName $resourceGroupName `
                    -Name $searchservice_name `
                    -Sku $searchserviceSKU `
                    -Location $location `
                    -PartitionCount 1 `
                    -ReplicaCount 1 `
                    -HostingMode Default

Write-Host "Search Service '$searchservice_name' created successfully"


$searchservice_endpoint = "https://$searchservice_name.search.windows.net"

#------- Azure Search - Configure Index, Indexer, SkillSets

$searchservice_adminapikey = (Get-AzSearchAdminKeyPair -ResourceGroupName $resourceGroupName -ServiceName $searchservice_name).Primary
$searchservice_queryapikey = (Get-AzSearchQueryKey -ResourceGroupName $resourceGroupName -ServiceName $searchservice_name).Key

$script = $PSScriptRoot+"\ms-poc-sdg-azure-search.ps1"
. $script -azSearchName $searchservice_name, $searchservice_adminapikey, $functionapp_skillset_name, $storageaccount_endpoint, $container_documents


#-------------------------------------------------------------------------------------------------------------------------
# Function App - Event Subscriber (for updating database)
#-------------------------------------------------------------------------------------------------------------------------

Write-Host "Creating Function App '$functionapp_eventsubscriber_name'....."

New-AzFunctionApp -Name $functionapp_eventsubscriber_name `
                    -ResourceGroupName $resourceGroupName `
                    -Location $location `
                    -StorageAccountName $storageaccount_name `
                    -Runtime DotNet `
                    -RuntimeVersion 6 `
                    -OSType Windows `
                    -FunctionsVersion 4 `
                    -IdentityType SystemAssigned

Write-Host "Function App '$functionapp_eventsubscriber' created successfully"


#------- Function App - Event Subscriber - Deploy Code

Write-Host "Deploying Function App '$functionapp_eventsubscriber_name' code.."
Publish-AzWebapp -Name $functionapp_eventsubscriber_name `
                 -ResourceGroupName $resourceGroupName `
                 -ArchivePath $functionapp_eventsubscriber_codepath `
                 -Force

Write-Host "Function App '$functionapp_eventsubscriber_name' code deployed successfully"



#------- Function App - Event Subscriber - Application Settings
 

#Configure Application Settings in Function App
Write-Host "Configuring Application Settings Function App '$functionapp_eventsubscriber_name'"

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"ConnectionStrings.MSPocSdgReadConnection" = $sql_connectionstring }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"ConnectionStrings.MSPocSdgWriteConnection" = $sql_connectionstring }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"ServiceBusConnectionString" = $servicebus_primaryconnectionstring }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"StorageConnectionString" = $storageaccount_endpoint }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"StorageName" = $storageaccount_name }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"Container" = $container_documents }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"Directory" = "" }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchApiKey" = $searchservice_adminapikey }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchServiceAdminApiKey" = $searchservice_adminapikey }
                                                        
Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchIndexerName" = "azureblob-indexer" }
                            
Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchIndexName" = "azureblob-index" }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchServiceEndPoint" = $searchservice_endpoint }

Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchServiceName" = $searchservice_name }

                            
Update-AzFunctionAppSetting -Name $functionapp_eventsubscriber_name `
                            -ResourceGroupName $resourceGroupName `
                            -AppSetting @{"SearchServiceQueryApiKey" = $searchservice_queryapikey }


Write-Host "Done: Configuring Application Settings Function App '$functionapp_eventsubscriber_name'"



#-------------------------------------------------------------------------------------------------------------------------
# Web App - Backend api
#-------------------------------------------------------------------------------------------------------------------------
Write-Host "Creating Web App '$webapp_backendapi_name'....."

New-AzAppServicePlan -ResourceGroupName $resourceGroupName `
                     -Name $webapp_serviceplan `
                     -Location $location `
                     -Tier "Free" `
                     -NumberofWorkers 1 `
                     -WorkerSize "Small"


New-AzWebApp -ResourceGroupName $resourceGroupName `
             -Name $webapp_backendapi_name `
             -AppServicePlan $webapp_serviceplan ` 

Write-Host "Web App '$webapp_backendapi_name' created successfully"               

$PropertiesObject = @{
    "CURRENT_STACK" =  "dotnet"
}

Write-Host "Web App '$webapp_backendapi_name' - setting .Net runtime & version"

New-AzResource  -PropertyObject $PropertiesObject `
                -ResourceGroupName $resourceGroupName `
                -ResourceType Microsoft.Web/sites/config/metadata `
                -ResourceName $webapp_backendapi_name `
                -Force

Set-AzWebApp -ResourceGroupName $resourceGroupName -Name $webapp_backendapi_name -NetFrameworkVersion "v6.0"



#------- Web App - Backend api - Update appsettings.json

$script = $PSScriptRoot+"\ms-poc-sdg-api-appsettings.ps1"
. $script $webapp_backendapi_codepath, $searchservice_name, $searchservice_adminapikey, $searchservice_queryapikey, $searchservice_endpoint, $container_documents, $storageaccount_endpoint, $sql_connectionstring


#------- Web App - Backend api - Deploy Code

Write-Host "Deploying Web App '$webapp_backendapi_name' code.."
Publish-AzWebapp -Name $webapp_backendapi_name `
                 -ResourceGroupName $resourceGroupName `
                 -ArchivePath $webapp_backendapi_codepath -Force

Write-Host "Web App '$webapp_backendapi_name' code deployed successfully"



#-------------------------------------------------------------------------------------------------------------------------
# Web App - UI
#-------------------------------------------------------------------------------------------------------------------------
Write-Host "Creating Web App '$webapp_ui_name'....."

New-AzWebApp -ResourceGroupName $resourceGroupName `
             -Name $webapp_ui_name `
             -AppServicePlan $webapp_serviceplan ` 

Write-Host "Web App '$webapp_ui_name' created successfully"               

$PropertiesObject = @{
    "CURRENT_STACK" =  "node"
}

Write-Host "Web App '$webapp_ui_name' - setting Node runtime & version"

New-AzResource -PropertyObject $PropertiesObject `
               -ResourceGroupName $resourceGroupName `
               -ResourceType Microsoft.Web/sites/config/metadata `
               -ResourceName $webapp_ui_name `
               -Force

$setting = @{"WEBSITE_NODE_DEFAULT_VERSION"="~18" }
Set-AzWebApp -ResourceGroupName $resourceGroupName -Name $webapp_ui_name -AppSettings $setting 

#------- Web App - Backend api - Deploy Code

Write-Host "Deploying Web App '$webapp_ui_name' code.."
Publish-AzWebapp -Name $webapp_ui_name `
                 -ResourceGroupName $resourceGroupName `
                 -ArchivePath $webapp_ui_codepath `
                 -Force

Write-Host "Web App '$webapp_ui_name' code deployed successfully"


#-------------------------------------------------------------------------------------------------------------------------

Write-Host "DEPLOYMENT COMPLETED"
