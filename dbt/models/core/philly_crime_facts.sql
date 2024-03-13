{{
    config(
        materialized='table'
    )
}}

SELECT * FROM {{ ref("stg_2006-2023_crime_data") }}

