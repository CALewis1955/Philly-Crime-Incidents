# Philly Crime Incidents

This repo contains the final project implemented for the Data Engineering zoomcamp course.  Many thanks to https://github.com/ara-25/nyc_crimes_de?tab=readme-ov-file whose project on New York crime analytics inspired this project.

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

## Link to Google Looker Studio -- Visualization of Data:  https://lookerstudio.google.com/reporting/14f14688-5d57-4193-bd13-019a9f023a5b.


##  Technology Stack
#### Code: Anaconda v.4.10.3, Python v.3.9.7
#### Infrastructure as Code: Terraform v.1.7.4 on Linux_amd64
#### Containerization: Docker v.25.0.4 and Docker Compose v.2.24.7 
#### Workflow Orchestration: Mage
#### Cloud Platform: Google Cloud
#### Data Lake: Google Cloud Storage
#### Data Warehouse: Google BigQuery
#### Data Transformation: dbt Cloud
#### Data Vizualization Tool --> Google Looker Studio


## Steps

1.  Create VM using Google Cloud Platform.
  a.  Create config file to SSH to GCS VM.
  b.  Install:
      1.  Anaconda
      2.  Docker
      3.  Docker-compose
      4.  Terraform
      5.  Mage
2.  Run bash files to download source files (by calendar year) from the Philadelphia Open Data Portal.
3.  Run Terraform to set up Google Cloud Storage bucket and BigQuery dataset.
4.  Use Mage pipeline to read files into Pandas, transform them by adding columns for the day of the week, month and quarter, load them as Parquet files in Google Cloud Storage, and then load them to Bigquery.
5.  Use dbt to run tests for uniqueness and not null, as well as to transform column names and organize the sourcing of the data.
6.  With Google Looker Studio, prepare charts to visualize the data.  


## Setup

    The setup guide from the Zoomcamp for Mage can be found here:  https://github.com/mage-ai/mage-zoomcamp/blob/master/README.md.


## Issues Encountered During the Project
  
    Since the source files had a "gz" compressed extension, I assumed they would be large when uncompressed.  This assumption was erroneous.  In fact, when I tried to read one into Pandas, I got an error stating that the file was not compressed at all.  It turns out that they are text files, even though they bear a "gz" extension.  Also, each year's data was relatively small, so I did not have to use a generator to read the files without using all the memory.  Nevertheless, when I tried to concatenate all years from 2006 through 2023, Mage froze up.  So I ended up creating a Parquet file for each year in Google Cloud Storage and then doing a "UNION ALL" in BigQuery to create one dataset.
    
    After I loaded the database into dbt, I realized I had not included the most recent full calendar year, 2023.  So I had to go back and add that year's data.  Fortunately, with the pipeline in Mage, this was an easy undertaking.  Then, in Google Looker Studio, I noted a sharp dropoff in reported crimes for the year 2008.  It turned out that 2008 had somehow been missed in the initial pipeline.  So I had to run the pipeline separately for that year as well.

    I wrote bash scriipts to download all the source files from the Philadelphia Open Data Portal.  There are two scripts--one for pre-2020 data and another for post-2020 data--because Philadelphia changed the format of the reports beginning in 2020.  

    During the earlier phases of this project, I tried to use Airflow for the workflow orchesration.  I found it endless frustrating and never got it to work, even with the stripped down configuration recommended in the 2022 DE Zoomcamp.
