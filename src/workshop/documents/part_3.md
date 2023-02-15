# Review the functionality of the deployed application

## Lab Goals
1. Complete the deployment and test the application
2. Upload documents to trigger the pipelines
1. Sample ESG Documents for testing the UI are located here: [ESG Reports](https://github.com/appliedcognetics/esgWorkshop/tree/main/src/workshop/data/ESG_reports)
3. Discuss how to extend with more **Cognitive Services**
4. Discuss training additional Models
5.  ** Day 2 Stretch Goal ** [Add the Vision Service](../documents/part_customVision.md), need to upload the code.
6. [Move on to OpenAI Section of the Workshop](../documents/part_2.md)


Add Text about the different views of the application
## Landing Page of Application

![AppLandingPage](../images/module03/LandingPage.png)

## ESG Document Drilldown Level 1
![AppDrillDown](../images/module03/appdrilldown.png)

## ESG Document Drilldown Level 2
![AppDrillDown2](../images/module03/appdrilldown_02.png)

## Uploading A Document & Triggering the Pipeline
![UploadandTrigger](../images/module03/uploadandanalyze.png)


# Discuss Azure Search and how the Custom Skills work 

1. Go to Azure Search Service
1. Observe the Navigation Bar
![SearchNAv](../images/module03/AzureSearchNav.jpg)
1. *Click*  **Index**
1. Select **azureblob-index**
1. In this interface you will be able to *Search* the *Index* and observe the enrichment provided by the *Custom Language Model* which was trained. The enrichments are in the JSON.
![SearchIndex](../images/module03/AzureSearch_Search_index.jpg) 