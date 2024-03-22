{{
    config(
        materialized='view'
    )
}}

SELECT police_district, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

GROUP BY police_district

ORDER BY count DESC