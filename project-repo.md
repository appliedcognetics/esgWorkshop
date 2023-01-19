setup user name
https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git


# Environment Setup

1) Setup Synapse
    - Include the options for Synapse Setup
2) Copy Sample Data into the ADLS Folder
3) Copy the Sample_NoteBook_1 into Synapse
    - Make the changes to the ADLS endpoint
    - Make other changes to the notebook
        - This notebook does the following
            - Reads the PDF documents GRI
            - Run the document through Cog Services Form recognizer
            - Load the data into a DataFrame 
            - Store the DataFrame into ADLS, COSMOSDB, Other Data Stores as needed
            - Write the Dataframe into Azure Search for Searching
        - Observe the data in Azure Search


4) NoteBook #2 
    - The notebook will be documented 
        - Steps read the first document from the folder
        - Perform some processing steps on the document
            - Capture Tables, Cog Services
            - Capture Text in different sections
            - Look for Metrics
                - Water Consumption
                - Energy and Emissons
                - Emissions Data
                - Get Locations
                - GRI Metrics https://www.globalreporting.org/
                - Keep the GRI Metrics and interate through them to understand how many of the GRI metrics appear in the report
            - Use the OpenAI to summarize and look for data
            - Use Entity Recognition
            - Write the Data into the various data Stores
        - Observe in Azure Search
        - Observe in the PowerBI Dash board

5) Develop the PowerPoint Presentation
    - Explain Methdology
        - Phase One of using the GRI of the rules
        - Explain Processing of GRI rules
        - Explain the methodology
        - Explain the reports and the reporting

    
            
https://www.globalreporting.org/standards/media/1037/gri-102-general-disclosures-2016.pdf

GRI Registered report

https://esg.apollo.com/_downloads/apollo-2021-esg-report-final.pdf

https://www.globalreporting.org/standards/media/1037/gri-102-general-disclosures-2016.pdf

Microsoft
https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4RwfV

IBM 
https://www.ibm.com/ibm/responsibility/reports/gri/gri.html

Old version
https://www.globalreporting.org/standards/media/1036/gri-101-foundation-2016.pdf
https://www.globalreporting.org/standards/media/1037/gri-102-general-disclosures-2016.pdf
https://www.globalreporting.org/standards/media/1038/gri-103-management-approach-2016.pdf

New version is 1_ = 101, 2_ = 102 , 3_ = 103

https://www.globalreporting.org/standards/media/1039/gri-201-economic-performance-2016.pdf


GRI 101, GRI 102 GRI 103


Methodology
- Consume the GRI Standards
    - Old Old Version G4 
        There is a mapping
        G4 - MAPPING of G4 to GRO
    https://www.globalreporting.org/standards/media/1098/mapping-g4-to-the-gri-standards-disclosures-full-overview.pdf
    - Old Version
        ** USE THE OLD VERSION
    - New Version
        - Build a Models of the Universal, Sectory and Topic Standard
        - Figure out the sector of the company
        - Look for for the sector standards that apply to the company
   

Using the Old version
    - Consume the reporting requirements for GRI
    - Consume 101, 102, 103

Steps
 - Grab the sustainability report for a company
    - Apollo
    - Microsoft
    - Apple
    - IBM 
- Process each report to break down the table and the text
    - This will be a pipeline of steps
        - Load Report
        - Identify Report Type
        - Process Report for Data
- Look for GRI for company
        - Get the matrix of data that a company is suppose to have
        - Parse the report for the data
    ##Technique define a rule for each GRI metric we are looking for , define a few rules
        If the metric is found then populate the data
        if the metric is not found 
            a) Modify the rule
            b) 

            Amount and Quality of Disclosure

            Repot that shows what they have and % completeness


NASDAQ
https://app.one-report.com/


1) Get the GRI that the company has by sector
2) Iterate through

Company Name | GRI | Data| Document

Report Side generate Synthenic



https://medium.com/chick-fil-atech

Pattern Energy
Apollo Management Group

-- Enterprise and Open Source
-- Color outside the lines , Kuber

LAMP Stack 
tutorial-lamp-stack
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-lamp-stack
https://azurearcjumpstart.io/



## Aliance Bernstein
Understand Insights - trends they are seeing
What companies are saying vs what they are doing

What does qualkity mean ?


Web Scraper, Downloads the ESG reports
- How does it determine which data to get
- Extract the information from the documents , text and tabular .. Store the information
- Enable Chat bot for QA ??

See the trends between 2019 and 2021
    - 

What chat bot are they using ?
MTC Session
Customer had specific question
- Once they scan the documents
- Word to Vec - Te

- Sematic Search - Long Document
Search - ESG Demo

Playwright
Bing