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
1. Create a *Blob Storage Container* named **esg-ls-training**
    - Upload the training data to the *Blob Storage Container* named **esg-ls-training**
    in the directory **src\workshop\data\training\language_studio\TrainingModelFiles**
    - Navigate to  *Blob Storage Container* named **esg-ls-training**
    - *Click* **Upload** , then upload the training data files from your local copy of the training data files. 
![UploadTraingData](../images/module01/Upload_trainingdata.png) 
    -

    **Note Make Sure the language resoure Managed Identity has "Storage Blob Data Owner" Permissions. [Information on Permissions Here ](https://learn.microsoft.com/en-us/azure/cognitive-services/language-service/custom-named-entity-recognition/how-to/create-project?tabs=portal%2Clanguage-studio#roles-for-your-azure-language-resource)**
    - Go to IAM Setting of the Storage Account and set the role for the language studio
    - Choose Storage Blob Owner Role
    - Add Managed Identity to Role
    - Choose the Managed Identity of the *Language Studio* account.
6. Copy the training data and training file to the Blog Storage Container named **esg-ls_training**

1. Connect to the training data Storage Account
1. Connect the tagged trainig data
1. Train and deploy the model
1. Test the model
1. Use the deployed model in the application, by entering the model name into the Azure Function.
1. Connect the Model to the Application Backend API.

Connect Storage for NER Training, if this was previously done in the setup of the Language Service *Click* **Next**
![LSConnectStorage](../images/module01/create-project_connect_storage.png)

Enter the basic information for the project
1. Project Name: Enter a project name **TraingNERModel*
1. Primary Language: English (US)
1. Description : Enter a description
1. *Click* **Next**
![LSEnterBAsic](../images/module01/create-project_enter_basic.png)

Choose the *Blob Storage Container* that has your training data
1. Setup *Blob Storage Container* for *Language Studio*
![LSLocation](../images/module01/create-project_enter_basic.png)


Blob Storage Setup
1. Create a container called esg_ls_training
1. Set the permissions on the container 