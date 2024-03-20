{{
    config(
        materialized='view'
    )
}}

SELECT quarter, COUNT(*) as count FROM {{ ref("stg_2006-2023_crime_data") }}

GROUP BY quarter

ORDER BY count DESC