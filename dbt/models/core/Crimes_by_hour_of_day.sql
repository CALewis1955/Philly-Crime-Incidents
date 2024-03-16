{{
    config(
        materialized='view'
    )
}}

SELECT hour, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

GROUP BY hour

ORDER BY count DESC