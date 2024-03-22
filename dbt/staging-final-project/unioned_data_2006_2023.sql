{{
    config(
        materialized='view'
    )
}}

with crime_data_2020_2023 as (select * from {{ ref('unioned_data_2020_2023') }} ),
    crime_data_2006_2019 as (select * from {{ ref('unioned_data_2006_2019') }} )

(SELECT 
    objectid,
    psa,
    dc_dist,
    dispatch_date_time,
    dispatch_date,
    dispatch_time,
    hour,
    dc_key,
    location_block,
    ucr_general,
    text_general_code,
    point_x,
    point_y,
    lat,
    lng,
    day,
    month,
    quarter
FROM crime_data_2020_2023

UNION ALL

SELECT 
    objectid,
    psa,
    dc_dist,
    dispatch_date_time,
    dispatch_date,
    dispatch_time,
    hour,
    dc_key,
    location_block,
    ucr_general,
    text_general_code,
    point_x,
    point_y,
    lat,
    lng,
    day,
    month,
    quarter
    
FROM crime_data_2006_2019)


-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
--{% if var("is_test_run", default=true) %} limit 100 {% endif %}