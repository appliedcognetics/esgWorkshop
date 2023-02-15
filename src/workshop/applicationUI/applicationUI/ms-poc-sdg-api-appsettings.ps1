

Write-Host("Started to process")

$searchSercviceName = $searchservice_name
$apikey = $searchservice_adminapikey
$apiVersion = "2021-04-30-Preview"
$indexername = "azureblob-indexer"
$SearchServiceEndPoint= $searchservice_endpoint
$indexName = "azureblob-index"
$skillsetName = "azureblob-skillset"
$dataSourceName = "sdgdatasource"
$container = $container_documents
$blobstorageConnectionString = $storageaccount_endpoint
$searchServiceQueryApiKey = $searchservice_queryapikey
$MSPocSdgReadWriteConnection = $sql_connectionstring

Add-Type -Assembly  System.IO.Compression.FileSystem
$ErrorActionPreference = 'Stop'

$file = $webapp_backendapi_codepath
$fileToEdit  = "appsettings.json"

$newContext=""
Write-Host("unziping.. file")
    try {
        $zip = [System.IO.Compression.ZipFile]::Open($file, "Update")
        $entries = $zip.Entries.Where({ $_.Name -like $fileToEdit })        
        foreach($entry in $entries) {
        Write-Host("entries ****** $entry")
            $reader  = [System.IO.StreamReader]::new($entry.Open())
            $content=$reader.ReadToEnd()
            $newContext=$content
            Write-Host("old content.. $content")
            #$content = $reader.ReadToEnd().Replace($toReplace, $replaceWith)
            #$text=$content 
            $reader.Close()
            $reader.Dispose()
            Write-Host("*********** $newContext newwwww content.. $content")

            $newContext=$newContext.Replace("[MSPocSdgReadConnection]", $MSPocSdgReadWriteConnection)
             $newContext=$newContext.Replace("[MSPocSdgWriteConnection]", $MSPocSdgReadWriteConnection) 
             $newContext=$newContext.Replace("[ConnectionString]", $blobstorageConnectionString) 
             $newContext=$newContext.Replace("[StorageName]", $dataSourceName) 
             $newContext=$newContext.Replace("[Container]", $container) 
             $newContext=$newContext.Replace("[SearchServiceName]", $searchSercviceName)
             $newContext=$newContext.Replace("[SearchServiceEndPoint]", $SearchServiceEndPoint)             
             $newContext=$newContext.Replace("[SearchServiceAdminApiKey]", $apikey)
             $newContext=$newContext.Replace("[SearchServiceQueryApiKey]", $searchServiceQueryApiKey)
             $newContext=$newContext.Replace("[SearchIndexName]", $indexName)
             $newContext=$newContext.Replace("[StorageConnectionString]", $blobstorageConnectionString)
             $newContext=$newContext.Replace("[SearchIndexerName]", $indexername)
             $newContext=$newContext.Replace("[SearchApiKey]", $apikey)
             $newContext=$newContext.Replace("[SearchApiVersion]", $apiVersion)
              

            Write-Host("after dispose content.. $content")
            $writer  = [System.IO.StreamWriter]::new($entry.Open())
            $writer.BaseStream.SetLength(0)
            $writer.Write($newContext)
            Write-Host("content write completed $newContext")
            $writer.Close()
            $writer.Dispose()
        }
    }
    catch {
        Write-Warning $_.Exception.Message
        continue
    }
    finally {
        if($zip) {
            $zip.Dispose()
        }
    }
Write-Host("File replace value from zip file completed..")
