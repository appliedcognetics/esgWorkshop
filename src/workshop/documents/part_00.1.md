# Setup of Function and Web Apps
[PDF File Re Writing this below](../documents/ms-sdg-poc-publish-setups.pdf)


# Register a New Application

In the Azure Portal , search for "Azure Active Directory"
 Click *Add* >> App Registration

- For Who can use this application or access this API ?
    Select **Accounts in this organizational directory only (Microsoft only - Single tenant)**
- Click Register
-

# Parameters needed for the Application
These values will need to be set in the function app config file according to the setup documentation above.

1. SearchIndexerName :  In Azure Search,create an indexer with the name : `azureblob-indexer`
1. SearchIndexName :  In Azure Search,Create an index with the name :`azureblob-index`
1. SearchServiceAdminApiKey : Set to: `[SEARCH SERVICE ADMIN API KEY]`
1. SearchApiKey : Set to:   `[SEARCH SERVICE ADMIN API KEY]`
![ServiceBusEndpoint](../images/module00.1/searchservicekey.png)


1. SearchServiceEndPoint : Set to :`https://<search-service name>.search.windows.net` get the name of the Azure Search Service Endpoint from the Azure portal. 

1. ServiceBusConnectionString : Set to: `[SERVICE BUS CONNECTION ENDPOINT` from the Azure Portal. Navigate to the Service Bus Namespace >> Shared Access Policies>> Click RootManageSharedAccessKey. Copy the generated **Primary Connection String**.
![ServiceBusEndpoint](../images/module00.1/service_bus_endpoint.png)
1. StorageConnectionString: Set to `[STORAGE CONNECTION_ STRING]` . Navigate to the Storage Account Blade. Click **Access Keys** , Copy the **Connection String**
![StorageAccountKey](../images/module00.1/get_storageaccount_key.png)