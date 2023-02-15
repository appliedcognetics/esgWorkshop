
Write-Host "Configuring Azure Search"


Write-Host $azSearchName;
#$azSearchName = "" ///Use this line for invidual script run

$searchServiceName = $searchservice_name
$apikey = $searchservice_adminapikey
$apiVersion = "2021-04-30-Preview"
$indexername = "azureblob-indexer"
$indexName = "azureblob-index"
$skillsetName = "azureblob-skillset"
$dataSourceName = "sdgstorage"
$container = $container_documents
$blobstorageConnectionString = $storageaccount_endpoint
$customskillsetAzureFunctionUrl= "https://$functionapp_skillset_name.azurewebsites.net/api/sdgslang?code=CUXA7DeCDtm6ukMDJ_vrkfhiZMFp7TBTGVGdC2h4qeV8AzFuMnPpWQ=="

$headers = @{
'api-key' = $apikey
'Content-Type' = 'application/json' 
'Accept' = 'application/json' }

		
#create index
Write-Host "Creating index $indexName"
 

$body=@"

{
  "@odata.context": "https://$searchServiceName.search.windows.net/$metadata#indexes/$entity",
  "@odata.etag": "\"0x8DAE1BF3CE28354\"",
  "name": "$indexName",
  "defaultScoringProfile": "",
  "fields": [
    {
      "name": "content",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_content_type",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": true,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_size",
      "type": "Edm.Int64",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": true,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_last_modified",
      "type": "Edm.DateTimeOffset",
      "searchable": false,
      "filterable": false,
      "retrievable": false,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_content_md5",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_name",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_path",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": true,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_storage_file_extension",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": true,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_content_type",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": true,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_language",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_author",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_title",
      "type": "Edm.String",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "metadata_creation_date",
      "type": "Edm.DateTimeOffset",
      "searchable": false,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": null,
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "people",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "organizations",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": true,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "locations",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "keyphrases",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "language",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "translated_text",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "en.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "pii_entities",
      "type": "Collection(Edm.ComplexType)",
      "fields": [
        {
          "name": "text",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "type",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "subtype",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "offset",
          "type": "Edm.Int32",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "length",
          "type": "Edm.Int32",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "score",
          "type": "Edm.Double",
          "searchable": false,
          "filterable": false,
          "retrievable": false,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        }
      ]
    },
    {
      "name": "masked_text",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "merged_content",
      "type": "Edm.String",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "text",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "layoutText",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "imageTags",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "imageCaption",
      "type": "Collection(Edm.String)",
      "searchable": true,
      "filterable": false,
      "retrievable": true,
      "sortable": false,
      "facetable": false,
      "key": false,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "analyzer": "standard.lucene",
      "normalizer": null,
      "synonymMaps": []
    },
    {
      "name": "classifiedtext",
      "type": "Collection(Edm.ComplexType)",
      "fields": [
        {
          "name": "category",
          "type": "Edm.String",
          "searchable": true,
          "filterable": true,
          "retrievable": true,
          "sortable": false,
          "facetable": true,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "confidenceScore",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": true,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "text",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": true,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "offset",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": true,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "length",
          "type": "Edm.String",
          "searchable": false,
          "filterable": true,
          "retrievable": true,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        },
        {
          "name": "subCategory",
          "type": "Edm.String",
          "searchable": false,
          "filterable": false,
          "retrievable": true,
          "sortable": false,
          "facetable": false,
          "key": false,
          "indexAnalyzer": null,
          "searchAnalyzer": null,
          "analyzer": null,
          "normalizer": null,
          "synonymMaps": []
        }
      ]
    }
  ],
  "scoringProfiles": [],
  "corsOptions": null,
  "suggesters": [
    {
      "name": "sg",
      "searchMode": "analyzingInfixMatching",
      "sourceFields": [
        "organizations"
      ]
    }
  ],
  "analyzers": [],
  "normalizers": [],
  "tokenizers": [],
  "tokenFilters": [],
  "charFilters": [],
  "encryptionKey": null,
  "similarity": {
    "@odata.type": "#Microsoft.Azure.Search.BM25Similarity",
    "k1": null,
    "b": null
  },
  "semantic": null
}
"@


$url = "https://$searchServiceName.search.windows.net/indexes?api-version=$apiVersion&`$select=name"

invoke-RestMethod -Uri $url -Headers $headers -Method post -Body $body | ConvertTo-Json
Write-Host "Created index $indexName"

#create datasource using blob storage
Write-Host "Creating datasource $dataSourceName"
$body=@"
{
  "@odata.context": "https://$searchServiceName.search.windows.net/$metadata#datasources/$entity",
  "@odata.etag": "\"0x8DB08A810B9DA4C\"",
  "name": "$dataSourceName",
  "description": null,
  "type": "azureblob",
  "subtype": null,
  "credentials": {
    "connectionString": "$blobstorageConnectionString"
  },
  "container": {
    "name": "$container",
    "query": null
  },
  "dataChangeDetectionPolicy": null,
  "dataDeletionDetectionPolicy": null,
  "encryptionKey": null,
  "identity": null
}
"@

$url="https://$searchServiceName.search.windows.net/datasources/?api-version=$apiVersion"

invoke-RestMethod -Uri $url -Headers $headers -Method post -Body $body | ConvertTo-Json
Write-Host "Created datasource $dataSourceName"

#create skill sets need custome skill set azure function URL
Write-Host "Creating skill set $skillsetName"

$body=@" 
{
  "@odata.context": "https://emtec-az-cgn-search-poc.search.windows.net/$metadata#skillsets/$entity",
  "@odata.etag": "\"0x8DB08A810C32862\"",
  "name": "azureblob-skillset",
  "description": "Skillset created from the portal. skillsetName: azureblob-skillset; contentField: merged_content; enrichmentGranularity: document; knowledgeStoreStorageAccount: ;",
  "skills": [
    {
      "@odata.type": "#Microsoft.Skills.Text.V3.EntityRecognitionSkill",
      "name": "#1",
      "description": null,
      "context": "/document/merged_content",
      "categories": [
        "Product",
        "PhoneNumber",
        "Person",
        "Quantity",
        "Organization",
        "IPAddress",
        "URL",
        "Email",
        "Event",
        "Skill",
        "Location",
        "PersonType",
        "Address",
        "DateTime"
      ],
      "defaultLanguageCode": "en",
      "minimumPrecision": null,
      "modelVersion": null,
      "inputs": [
        {
          "name": "text",
          "source": "/document/merged_content"
        },
        {
          "name": "languageCode",
          "source": "/document/language"
        }
      ],
      "outputs": [
        {
          "name": "persons",
          "targetName": "people"
        },
        {
          "name": "organizations",
          "targetName": "organizations"
        },
        {
          "name": "locations",
          "targetName": "locations"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Text.KeyPhraseExtractionSkill",
      "name": "#2",
      "description": null,
      "context": "/document/merged_content",
      "defaultLanguageCode": "en",
      "maxKeyPhraseCount": null,
      "modelVersion": null,
      "inputs": [
        {
          "name": "text",
          "source": "/document/merged_content"
        },
        {
          "name": "languageCode",
          "source": "/document/language"
        }
      ],
      "outputs": [
        {
          "name": "keyPhrases",
          "targetName": "keyphrases"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Text.LanguageDetectionSkill",
      "name": "#3",
      "description": null,
      "context": "/document",
      "defaultCountryHint": null,
      "modelVersion": null,
      "inputs": [
        {
          "name": "text",
          "source": "/document/merged_content"
        }
      ],
      "outputs": [
        {
          "name": "languageCode",
          "targetName": "language"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Text.MergeSkill",
      "name": "#6",
      "description": null,
      "context": "/document",
      "insertPreTag": " ",
      "insertPostTag": " ",
      "inputs": [
        {
          "name": "text",
          "source": "/document/content"
        },
        {
          "name": "itemsToInsert",
          "source": "/document/normalized_images/*/text"
        },
        {
          "name": "offsets",
          "source": "/document/normalized_images/*/contentOffset"
        }
      ],
      "outputs": [
        {
          "name": "mergedText",
          "targetName": "merged_content"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Vision.OcrSkill",
      "name": "#7",
      "description": null,
      "context": "/document/normalized_images/*",
      "textExtractionAlgorithm": null,
      "lineEnding": "Space",
      "defaultLanguageCode": "en",
      "detectOrientation": true,
      "inputs": [
        {
          "name": "image",
          "source": "/document/normalized_images/*"
        }
      ],
      "outputs": [
        {
          "name": "text",
          "targetName": "text"
        },
        {
          "name": "layoutText",
          "targetName": "layoutText"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Vision.ImageAnalysisSkill",
      "name": "#8",
      "description": null,
      "context": "/document/normalized_images/*",
      "defaultLanguageCode": "en",
      "visualFeatures": [
        "tags",
        "description"
      ],
      "details": [],
      "inputs": [
        {
          "name": "image",
          "source": "/document/normalized_images/*"
        }
      ],
      "outputs": [
        {
          "name": "tags",
          "targetName": "imageTags"
        },
        {
          "name": "description",
          "targetName": "imageCaption"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Custom.WebApiSkill",
      "name": "#9",
      "description": null,
      "context": "/document",
      "uri": "$customskillsetAzureFunctionUrl",
      "httpMethod": "post",
      "timeout": "PT30S",
      "batchSize": 10,
      "degreeOfParallelism": 2,
      "inputs": [
        {
          "name": "meta_Data_path",
          "source": "/document/metadata_storage_path"
        },
        {
          "name": "sdgslang",
          "source": "/document/merged_content"
        }
      ],
      "outputs": [
        {
          "name": "classifiedtext",
          "targetName": "classifiedtext"
        }
      ],
      "httpHeaders": {}
    }
  ],
  "cognitiveServices": null,
  "knowledgeStore": null,
  "encryptionKey": null
}
"@
 

 $url="https://$searchServiceName.search.windows.net/skillsets/?api-version=$apiVersion"

 invoke-RestMethod -Uri $url -Headers $headers -Method post -Body $body | ConvertTo-Json
 Write-Host "Created skill set $skillsetName"


#create indexers
Write-Host "Creating indexer $skillsetName"

$body=@"
{
  "@odata.context": "https://$searchServiceName.search.windows.net/$metadata#indexers/$entity",
  "@odata.etag": "\"0x8DB0DB7DB24A180\"",
  "name": "$indexername",
  "description": "",
  "dataSourceName": "$dataSourceName",
  "skillsetName": "$skillsetName",
  "targetIndexName": "$indexName",
  "disabled": null,
  "schedule": {
    "interval": "PT1H",
    "startTime": "2023-02-13T12:45:48.762Z"
  },
  "parameters": {
    "batchSize": null,
    "maxFailedItems": 0,
    "maxFailedItemsPerBatch": 0,
    "base64EncodeKeys": null,
    "configuration": {
      "imageAction": "generateNormalizedImages",
      "dataToExtract": "contentAndMetadata",
      "parsingMode": "default"
    }
  },
  "fieldMappings": [
    {
      "sourceFieldName": "metadata_storage_path",
      "targetFieldName": "metadata_storage_path",
      "mappingFunction": {
        "name": "base64Encode",
        "parameters": null
      }
    }
  ],
  "outputFieldMappings": [
    {
      "sourceFieldName": "/document/merged_content/people",
      "targetFieldName": "people"
    },
    {
      "sourceFieldName": "/document/merged_content/organizations",
      "targetFieldName": "organizations"
    },
    {
      "sourceFieldName": "/document/merged_content/locations",
      "targetFieldName": "locations"
    },
    {
      "sourceFieldName": "/document/merged_content/keyphrases",
      "targetFieldName": "keyphrases"
    },
    {
      "sourceFieldName": "/document/language",
      "targetFieldName": "language"
    },
    {
      "sourceFieldName": "/document/merged_content/translated_text",
      "targetFieldName": "translated_text"
    },
    {
      "sourceFieldName": "/document/merged_content",
      "targetFieldName": "merged_content"
    },
    {
      "sourceFieldName": "/document/normalized_images/*/text",
      "targetFieldName": "text"
    },
    {
      "sourceFieldName": "/document/normalized_images/*/layoutText",
      "targetFieldName": "layoutText"
    },
    {
      "sourceFieldName": "/document/normalized_images/*/imageTags/*/name",
      "targetFieldName": "imageTags"
    },
    {
      "sourceFieldName": "/document/normalized_images/*/imageCaption",
      "targetFieldName": "imageCaption"
    },
    {
      "sourceFieldName": "/document/classifiedtext",
      "targetFieldName": "classifiedtext"
    }
  ],
  "cache": null,
  "encryptionKey": null
}
"@

$url="https://$searchServiceName.search.windows.net/indexers/?api-version=$apiVersion"

invoke-RestMethod -Uri $url -Headers $headers -Method post -Body $body | ConvertTo-Json
Write-Host "Created indexer $indexername"
