{{
    config(
        materialized='view'
    )
}}

SELECT
    hour,
    COUNT(*) AS count
FROM {{ ref("unioned_data_2006_2023") }}

GROUP BY hour

ORDER BY count DESC
