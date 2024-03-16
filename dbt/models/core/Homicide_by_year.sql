{{
    config(
        materialized='view'
    )
}}

SELECT EXTRACT( YEAR FROM dispatch_date ) as year, crime_type, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

WHERE crime_type = 'Homicide - Criminal'

GROUP BY year, crime_type

ORDER BY count DESC