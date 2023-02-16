## Databricks Setup

```Note :There are various documentation and reference links below```

1. Create a Free DataBricks Service in your **Resource Group**. [See Documentation Here](https://learn.microsoft.com/en-us/azure/databricks/getting-started/)
1. *Click* **Create a Resource**, type **databricks** and *Click* the **DataBricks** tile.
![CrearteDB](../images/module00/portal_createDatabricks.png)
1. *Select* the **Azure Databricks Resource** and enter the instance details.
    * Workspace Name : *Unique name for your Workspace*
    * Region : **Same Region as you *Lab* Resource Group** 
    * Pricing Tier : *Select* **Free**
![CreateWorkspace](../images/module00/portal_createDatabricks_workspace.png)

1. Once the **Databricks** resource is installed, *Navigate* to Launch Databricks Workspace.
![Launch DB](../images/module00/launch_db.png) 
1. Create a Cluster
![Create A Cluster](../images/module00/create_a_cluster.png) 
1. Using the default settings, shown in the image, for this *Lab* we only need a single user instance. **Apache 3.3.0**, **DataBricks 11.3 LTS** worked in this example. Check the advise of the SynapseML documentation if there is an issue.
![Cluster Settings](../images/module00/default_cluster.png) 
1. Install the PyMUPDF libraries for the cluster.
![Install Libraries](../images/module00/install_libraries.png)  
1. Enter **pymupdf==1.21.0**
1. Click **Install**
    ![Install PyMUPDF](../images/module00/install_pymupdf.png)

1. Next install the SynapseML Package.
    * NOTE: **Make sure to used Coordinates com.microsoft.azure:synapseml-cognitive_2.12:0.10.2**,otherwise you will get an error.
    ![Install SynapseML](../images/module00/install_synapse_ml.png)
1. Enter **com.microsoft.azure:synapseml-cognitive_2.12:0.10.2** into the **Coordinates**
1. DataBricks will be used later on in the lab for the OpenAI Section
1. Setup the Secret Scopes
* You will need the lab keyvault to complete this next step
* [Databricks KeyVault secret scopes](https://learn.microsoft.com/en-us/azure/databricks/security/secrets/secret-scopes)  use scope named **labsecrets**
* A lab coach will help with this section
* If there is not enough time hard code the keys in your notebook 
    
1. Proceed to [OpenAI Modules Here](../documents/part_openai.md) 


## Reference Links
1. [SynapseML Documenation](https://microsoft.github.io/SynapseML/docs/getting_started/installation/#databricks)
1. [Databricks KeyVault secret scopes](https://learn.microsoft.com/en-us/azure/databricks/security/secrets/secret-scopes) 
1. [Secret Scopes](https://learn.microsoft.com/en-us/azure/databricks/dev-tools/cli/)

# Setup 

