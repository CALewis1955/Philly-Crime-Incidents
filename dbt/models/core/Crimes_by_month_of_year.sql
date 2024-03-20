{{
    config(
        materialized='view'
    )
}}

SELECT month, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

GROUP BY month

ORDER BY count DESC