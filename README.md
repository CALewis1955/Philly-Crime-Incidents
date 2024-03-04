# Philly-Crime-Incidents

This repo contains the final project implemented for the Data Engineering zoomcamp course.  Many thanks to https://github.com/ara-25/nyc_crimes_de?tab=readme-ov-file whose project on New York crime analytics inspired this project.

## Objective

The general public views crime as a pervasive and enduring problem in America's large cities.  Philadelphia, in particular, has gained notoriety as the home of the East Coast's largest open-air drug market, an area of the city where opiate addicts and drug dealers congregate to supply this life-destroying addiction.  Politics and the presidential election cycle have intentionally provoked public anxiety about rising crime.

This project seeks to determine whether the fears are justified or, instead, are misplaced.  From police incident reports we can determine whether reported incidents of crime are increasing, the severity of those crimes, and the relative safety of various neighborhoods in the city.  

## Data Source

  The City of Philadelphia maintains a catalog of open data in the Philadelphia region https://opendataphilly.org/.  The catalog contains 44 datasets relating to public safety https://opendataphilly.org/categories/public-safety/.  For this project we will be using the dataset of crime incidents as reported by the Philadelphia Police Department:  https://opendataphilly.org/datasets/crime-incidents/.  The crimes reported range from violent offenses such as aggravated assault, rape, and arson, among others, to non-violent offenses, such as prostituion, gambling, and fraud, that today are considered quality of life indicators. The dataset includes fields that identify the police district involved, the date and time an officer was dispatched to the scene, the location of the crime generalized by street block, and the latitude and longitude of the crime location.  The geo data allows the creation of visualizations that depict the location of various crimes. 

##  Technology Stack

#### Infrastructure as Code: Terraform
#### Cloud Platform: Google Cloud
#### Data Lake: Google Cloud Storage
#### Data Warehouse: Google BigQuery
#### Data Transformation: Pandas, PySpark
#### Workflow Orchestration --> Mage
#### Containerization --> Docker and Docker Compose
#### Data Vizualization Tool --> Google Data Studio
