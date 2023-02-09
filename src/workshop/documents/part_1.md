# Lab Model Training

## Goal 
To train custom NER (Named Entity Recognition) Model for use in the application. The NER model will be trained on ESG documents to recognized to identify relevant ESG data and terms in a document. The results of the NER process will be stored in the Azure SQL Database and the Azure Search Index for use by the application.

- Sub Goal Train Custom Vision Model or use existing custom vision model.


1. Ensure prerequistes are completed from [part 0](documents/part_0.md)  
2. Navigate to the [training data direcoty] (src/workshop/data/training)
3. Navigate to [Language Studio](https://language.cognitive.azure.com/).Login with your same Azure credentials
4. Pick Custom Name Entity Project
![Custom NER Project](../images/module01/language_studio_ner.png) 
5. Ensure there is a blob container in the storage account needed for training.

    **Note Make Sure the language resoure Managed Identity has "Storage Blob Data Owner" Permissions. [Information on Permissions Here ](https://learn.microsoft.com/en-us/azure/cognitive-services/language-service/custom-named-entity-recognition/how-to/create-project?tabs=portal%2Clanguage-studio#roles-for-your-azure-language-resource)**

1. Connect to the training data Storage Account
1. Connect the tagged trainig data
1. Train and deploy the model
1. Test the model
1. Use the deployed model in the application, by entering the model name into the Azure Function.
1. Connect the Model to the Application Backend API.

# Finish this Section the Storage Account was not working eariler

