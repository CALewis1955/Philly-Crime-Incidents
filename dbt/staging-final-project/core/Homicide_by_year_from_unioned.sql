{{
    config(
        materialized='view'
    )
}}

SELECT EXTRACT( YEAR FROM dispatch_date ) as year, COUNT(*) as count FROM {{ ref("unioned_data_2006_2023") }}

WHERE text_general_code = 'Homicide - Criminal'

GROUP BY year

ORDER BY count DESC