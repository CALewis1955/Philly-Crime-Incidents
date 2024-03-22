{{
    config(
        materialized='view'
    )
}}

SELECT * FROM {{ source('staging-final-project', 'crime_data_2009')}}