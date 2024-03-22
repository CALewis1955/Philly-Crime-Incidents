# Philly Crime Incidents

This repo contains the final project implemented for the Data Engineering zoomcamp course.  Many thanks to https://github.com/ara-25/nyc_crimes_de?tab=readme-ov-file whose project on New York crime analytics inspired this project.  This is a batch project.

## Objective

The general public views crime as a pervasive and enduring problem in America's large cities.  Philadelphia, in particular, has gained notoriety as the home of the East Coast's largest open-air drug market, an area of the city where opiate addicts and drug dealers congregate to supply this life-destroying addiction.  Politics and the presidential election cycle have intentionally provoked public anxiety about rising crime.

This project seeks to determine whether the fears are justified or, instead, are misplaced.  From police incident reports we can determine whether reported incidents of crime are increasing, the severity of those crimes, and the relative safety of various neighborhoods in the city.  

## Data Source

  The City of Philadelphia maintains a catalog of open data in the Philadelphia region https://opendataphilly.org/.  The catalog contains 44 datasets relating to public safety https://opendataphilly.org/categories/public-safety/.  For this project we will be using the dataset of crime incidents as reported by the Philadelphia Police Department:  https://opendataphilly.org/datasets/crime-incidents/.  The crimes reported range from violent offenses such as aggravated assault, rape, and arson, among others, to non-violent offenses, such as prostituion and gambling, that today are sometimes considered quality of life indicators. The dataset includes fields that identify the police district involved, the date and time an officer was dispatched to the scene, the location of the crime generalized by street block, and the latitude and longitude of the crime location.  The geo data allows the creation of visualizations that depict the location of various crimes. 

## Key Questions to Answer

1.  Which police districts are the safest?  Which have the most reported crimes?
2.  Are high crime districts high in both violent and non-violent crimes?
3.  Has violent crime increased over time?
4.  What is the trend in the frequency of non-violent crime?
5.  What is the distribution of violent crimes?  Of non-violent crimes?
6.  What time of day is safest?  Most dangerous?

## Link to Google Looker Studio -- Dashboard and visualization of Data:  [https://lookerstudio.google.com/reporting/14f14688-5d57-4193-bd13-019a9f023a5b.](https://lookerstudio.google.com/reporting/3f3b14ec-0b6e-4804-bc8e-99944ca9453a).  Please note that this multi-page report is for educational purposes only and should NOT be relied upon as representing a fully accurate reporting of crime incidents in the City of Philadelphia. 


##  Technology Stack
#### Code: Anaconda v.4.10.3, Python v.3.9.7
#### Infrastructure as Code: Terraform v.1.7.4 on Linux_amd64
#### Containerization: Docker v.25.0.4 and Docker Compose v.2.24.7 
#### Workflow Orchestration: Mage
#### Cloud Platform: Google Cloud
#### Data Lake: Google Cloud Storage
#### Data Warehouse: Google BigQuery
#### Data Transformation: dbt Cloud
#### Data Vizualization Tool: Google Looker Studio


## Steps and Reproducibility

1.  Create VM using Google Cloud Platform.
  a.  Create config file to SSH to GCS VM.
  b.  Install:
      1.  Anaconda
      2.  Docker
      3.  Docker-compose
      4.  Terraform
      5.  Mage
2.  Run bash files to download source files (by calendar year) from the Philadelphia Open Data Portal.  The bash files are in the "scripts" folder in Mage.  
3.  Run Terraform to set up Google Cloud Storage bucket and BigQuery dataset.
4.  Use Mage pipeline to read files into Pandas, transform them by adding columns for the day of the week, month and quarter, load them as Parquet files in Google Cloud Storage, and then load them to Bigquery.  The final project is located in the "staging-final-project" directory of the dbt folder.
5.  The Mage pipeline creates a file for each year of data, from 2006 to 2023.  The files are unioned in dbt.
6.  I also used dbt to run tests for uniqueness and not null, as well as to transform column names and organize the sourcing of the data.  These tests revealed that there are issues with the uniqueness and completeness of the data.  I wrote code to filter out duplicate rows, but when I did so, the overall numbers were significantly lower than those public reported by the City of Philadelphia.  Further analysis is required to identify why these discrepancies are arising.
7.  With Google Looker Studio, prepare charts to visualize the data.  


## Setup

The setup guide from the Zoomcamp for Mage can be found here:  https://github.com/mage-ai/mage-zoomcamp/blob/master/README.md.


## Issues Encountered During the Project
  
I wrote bash scriipts to download all the source files from the Philadelphia Open Data Portal.  There are two scripts--one for pre-2020 data and another for post-2020 data--because Philadelphia changed the format of the reports beginning in 2020. 

Since the source files had a "gz" compressed extension, I assumed they would be compressed.  This assumption was erroneous.  In fact, when I tried to read one into Pandas, I got an error stating that the file was not compressed at all.  It turns out that they are text files, even though they bear a "gz" extension.  The Mage loader converts the files into "txt" files and reads them into Pandas.  Each year's data ranges from 30 to 40 megabytes in size, so I did not have to use a generator to read the files without using all the memory.  Nevertheless, when I tried to concatenate all years from 2006 through 2023, Mage froze up.  So I ended up creating a Parquet file for each year in Google Cloud Storage and then doing a "UNION ALL" in dbt to create one dataset.  The files are posted annually by the City of Philadelphia.  In Mage, I created a trigger for the pipeline to run at least once more next year, in 2025, but the download script and pipeline would need to be modified to change the ending year of the range. 
    
My first attempt at the project is contained in the "models" folder in dbt.  After I loaded the database, I realized I had not included the most recent full calendar year, 2023.  So I had to go back and add that year's data.  Fortunately, with the pipeline in Mage, this was an easy undertaking.  Then, in Google Looker Studio, I noted a sharp dropoff in reported crimes for the year 2008.  It turned out that 2008 had not been included because I derived the date for the year from the first reported crime of the year, and sometimes those had a dispatch date from the prior year.  After ironing out all of these wrinkles, I decided to rebuild the project from scratch, and did so revising both the Mage and the dbt code.  The dbt files for the final project and dashboard are contained in the "staging-final-project" folder.

During the earlier phases of this project, I tried to use Airflow for the workflow orchesration.  I found it endlessly frustrating and never got it to work, even with the stripped down configuration recommended in the 2022 DE Zoomcamp.

### Conclusions from the Data

The data reveal the impact of the pandemic.  Serious crime was largely in decline before the pandemic and has been increasing post-pandemic.  Likewise, the number of homicides jumped in the post-pandemic years.  Since Democrats have controlled municipal government in Philadelphia for at least the last half a century, my conclusio is that the crime rate is governed more by societal conditions like the pandemic than who may hold political office.      
