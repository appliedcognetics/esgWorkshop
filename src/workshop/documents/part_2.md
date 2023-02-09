# Using OpenAI to process ESG Report
## Also using Cog Services and Custom Vision

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

