# OpenAI Module

## OpenAI Discussion
This module will demostrate how to use OpenAI for extracting and classifying data in ESG documents.

The Azure OpenAI service provides REST API access to OpenAI's powerful language models including the GPT-3, Codex and Embeddings model series. These models can be easily adapted to your specific task including but not limited to content generation, summarization, semantic search, and natural language to code translation. Users can access the service through REST APIs, Python SDK, or our web-based interface in the Azure OpenAI Studio. [OpenAI Overview](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview)

## SynapseML Discussion
SynapseML will be used to leverage OpenAI in Databricks.

SynapseML is an ecosystem of tools aimed towards expanding the distributed computing framework Apache Spark in several new directions. SynapseML adds many deep learning and data science tools to the Spark ecosystem, including seamless integration of Spark Machine Learning pipelines with Microsoft Cognitive Toolkit (CNTK), LightGBM and OpenCV. These tools enable powerful and highly scalable predictive and analytical models for many types of datasources.[SynapseML Documentation](https://microsoft.github.io/SynapseML/)


## Notebooks Links and Descriptions here (Add Notebooks these links are not correct)
### Notebook 1 Description [Notebook 1 Link Here](../notebooks/notebook1.ipynb)
### Notebook 2 Description [Notebook 2 Link Here](../notebooks/notebook1.ipynb)
### Notebook 3 Description [Notebook 3 Link Here](../notebooks/notebook1.ipynb)

# OpenAI Reference Material

https://github.com/openai/openai-cookbook/tree/main/examples


# Continue Working Here
# Using OpenAI to process ESG Report


## Lab Goals
Use OpenAI to: 
1. Classify document content pages with OpenAI Completion
2. Summarize the pages in a document with OpenAI
3. Decypher any info graphics on the page ? To Extract the Data
4. What is on the page ?
            1. Classify the information on each page and with what data it contains
            2. Run Form Recognizer (Layout)
                -- try Parsing the form into a json
            1. I
               

## Steps
Steps are in the DataBricks Notebook 


# Discussion about OpenAI

This lab will be a general discussion about OpenAI and it's operations, including "completion", prompt engineering , adjusting settings like "temperature" and the Model

1) Self services options
2) Providing the Platinum level services for everyone
Layering over existing systems
Partner Team


## Insert Examples using ESG Document text information and using the "rules" for extaction do this using the PDF library to extract the text

## Example 1
    
The example will attempt to understand the classification of each page >accoring to a list of classifactions we provide

     ### Steps
        1. Run the notebook that will parse and create "page" objects of the document.
        2. Observe te list of classifications for the pages provided 
        > ["About Us","Location Information", "Appendix","CEO Statement"]
        3. Run the Notebook to demostrate how  OpenAI to classify each page of the document.
        4. The lab will be to modify the "prompt" to further classify the pages. eg "Corporate Structure" , "Senior Leadership Statements"
        
    ### Extend the Example
        1. Modify the prompt to provide a structured list of major topics on each page
        2. Create a prompt to find "The Water & Waste Footprint" and extract the statistics on this page in table form


# Needs Completion 
- Build some completions based on GRI
- Write the data to the database & Search Index for the UI




## Important Subjects
1. https://beta.openai.com/docs/introduction/key-concepts
    1. 1500 Words for context
    2. [Tokenizer Tool](https://beta.openai.com/tokenizer)
    3. Crafting good instructions is important for getting good results
1. [Stop Sequences](https://help.openai.com/en/articles/5072263-how-do-i-use-stop-sequences)
2. [Prompt Engineering](https://help.openai.com/en/articles/6654000-best-practices-for-prompt-engineering-with-openai-api)
    1. Explain Parameters [See the API](https://beta.openai.com/docs/api-reference/completions/create)
3. Example  https://beta.openai.com/examples
1.https://docs.google.com/document/d/1h-GTjNDDKPKU_Rsd0t1lXCAnHltaXTAzQ8K2HRhQf9U/edit#
1.https://github.com/openai/openai-cookbook/blob/main/examples/azure/completions.ipynb
1.https://pymupdf.readthedocs.io/en/latest/tutorial.html#some-document-methods-and-attributes
1. https://github.com/openai/openai-cookbook/tree/main/examples
1. https://www.allabtai.com/prompt-engineering-tips-zero-one-and-few-shot-prompting/#:~:text=One-shot%20prompting%20is%20used%20to%20generate%20natural%20language,create%20more%20sophisticated%20and%20effective%20text%20generation%20systems.
1. https://subscription.packtpub.com/book/data/9781800563193/2/ch02lvl1sec06/understanding-prompts-completions-and-tokens


## Examples
Text- From the Apollo Report

What is the title of this page and summarize the ESG related topics in the text below:

"""
About Page Text here :
"""

Links

https://github.com/openai/openai-cookbook/blob/main/examples/azure/completions.ipynb

Presentation for creating quick POC
https://github.com/Azure/business-process-automation


