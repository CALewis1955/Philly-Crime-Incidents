# Philly-Crime-Incidents

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
7.  How effective are police in deterring crime in a district?  That is, do the crimes decrease by a significant percentage in any districts over the course of a few years?

##  Technology Stack

#### Infrastructure as Code: Terraform
#### Cloud Platform: Google Cloud
#### Data Lake: Google Cloud Storage
#### Data Warehouse: Google BigQuery
#### Data Transformation: Pandas, PySpark
#### Workflow Orchestration --> Mage
#### Containerization --> Docker and Docker Compose
#### Data Vizualization Tool --> Google Data Studio


## Steps
1.  Create VM using Google Cloud Platform.
  a.  Create config file to SSH to GCS VM.
  b.  Install:
      1.  Anaconda
      2.  Docker
      3.  Docker-compose
      4.  Terraform
      5.  Mage
  c.  Versions
      a.  Python 3.11.4
      b  Pandas 1.5.3
      c.  Docker 24.0.5
      d.  Docker-compose 2.24.6

## Setup

  The setup guide from the Zoomcamp for installing Spark can be found here:  https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/05-batch/setup/linux.md.  The setup guide from the Zoomcamp for installing PySpark can be found here:  https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/05-batch/setup/pyspark.md.
