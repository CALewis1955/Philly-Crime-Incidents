{{
    config(
        materialized='view'
    )
}}

SELECT EXTRACT( YEAR FROM dispatch_date ) as year, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

WHERE ucr_code < 800

GROUP BY year

ORDER BY count DESC