# ESG Project

# Introduction

- The ESG project leverages Azure Congitive Search, Azure Cognitive Services, SPARK and SynapseML to determine the completeness and the quality of ESG reports published by organizations. The completeness of the report will be determined by the number of reporting meterics statisfied (GRI, UN SDG). The quality of the report will be evaluated by quality of the data provided. Determining data quality will be more subjective and can be modifited by the user of this project to satify the needful business rules of their organization.

    Determining Quality Example
        The data quality is a subjective measure. For the sake of this document we will determine quality as 
            - The "cost" ability to easiliy parse the data into a structured format.
            - The accuracy of the data as evaluated by a 3rd party system
            - The accuracy compared to other meterics tdb

- The project shows a sample methodology which uses the GRI https://www.globalreporting.org/ as the canonical standard for the following operations
    1. Evaluate the completness of the ESG Report
    2. Evaluate the quality of the ESG report
    3. Extact the data according to the GRI guidelines (sample reports)
        - Store the GRI rules into a Purview Data G
    4. Save the extracted data into a DataLake
    5. Save the extracted into Azure Search (this will be the interface)
    6. Show a dashboard of the results of the operation

The project can be extended to use the UN SDG goals by following a similar pattern

Given the complexity of ESG reporting this project will provide a framework for developing for GRI which can be expanded by the user.

# The Process
    - The framework will show an example of consuming the GRI guidelines as an example of how the project can consume semi-structured data to produce a rule set which will be used by the remainder of the platform to perform the needful processing.

    GRI Guidelines include :
       - Disclosure
            - Disclosure Number
            - Disclosure Rules




