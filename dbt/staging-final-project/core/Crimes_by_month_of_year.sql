{{
    config(
        materialized='view'
    )
}}

SELECT month, COUNT(*) as count FROM {{ ref("unioned_data_2006_2023") }}

GROUP BY month

ORDER BY count DESC