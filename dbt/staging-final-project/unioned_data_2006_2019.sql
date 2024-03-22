{{
    config(
        materialized='view'
    )
}}

with crime_data_2006 as (select * from {{ source('staging-final-project', 'crime_data_2006') }} ),
    crime_data_2007 as (select * from {{ source('staging-final-project', 'crime_data_2007') }} ),
    crime_data_2008 as (select * from {{ source('staging-final-project', 'crime_data_2008') }} ),
    crime_data_2009 as (select * from {{ source('staging-final-project', 'crime_data_2009') }} ),
    crime_data_2010 as (select * from {{ source('staging-final-project', 'crime_data_2010') }} ),
    crime_data_2011 as (select * from {{ source('staging-final-project', 'crime_data_2011') }} ),
    crime_data_2012 as (select * from {{ source('staging-final-project', 'crime_data_2012') }} ),
    crime_data_2013 as (select * from {{ source('staging-final-project', 'crime_data_2013') }} ),
    crime_data_2014 as (select * from {{ source('staging-final-project', 'crime_data_2014') }} ),
    crime_data_2015 as (select * from {{ source('staging-final-project', 'crime_data_2015') }} ),
    crime_data_2016 as (select * from {{ source('staging-final-project', 'crime_data_2016') }} ),
    crime_data_2017 as (select * from {{ source('staging-final-project', 'crime_data_2017') }} ),
    crime_data_2018 as (select * from {{ source('staging-final-project', 'crime_data_2018') }} ),
    crime_data_2019 as (select * from {{ source('staging-final-project', 'crime_data_2019') }} )

select * from crime_data_2006

UNION ALL

select * from crime_data_2007

UNION ALL

select * from crime_data_2008

UNION ALL

select * from crime_data_2009
UNION ALL

select * from crime_data_2010
UNION ALL

select * from crime_data_2011
UNION ALL

select * from crime_data_2012
UNION ALL

select * from crime_data_2013
UNION ALL

select * from crime_data_2014
UNION ALL

select * from crime_data_2015
UNION ALL

select * from crime_data_2016
UNION ALL

select * from crime_data_2017
UNION ALL

select * from crime_data_2018
UNION ALL

select * from crime_data_2019



