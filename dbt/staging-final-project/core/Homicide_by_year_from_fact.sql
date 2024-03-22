{{
    config(
        materialized='view'
    )
}}

SELECT EXTRACT( YEAR FROM dispatch_date ) as year, COUNT(*) as count FROM {{ ref("final_project_fact") }}

WHERE crime_type = 'Homicide - Criminal'

GROUP BY year

ORDER BY count DESC