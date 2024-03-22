{{
    config(
        materialized='view'
    )
}}

with crime_data_2023 as (select * from {{ source('staging-final-project', 'crime_data_2023') }} ),
    crime_data_2022 as (select * from {{ source('staging-final-project', 'crime_data_2022') }} ),
    crime_data_2021 as (select * from {{ source('staging-final-project', 'crime_data_2021') }} ),
    crime_data_2020 as (select * from {{ source('staging-final-project', 'crime_data_2020') }} )

select * from crime_data_2023

UNION ALL

select * from crime_data_2022

UNION ALL

select * from crime_data_2021

UNION ALL

select * from crime_data_2020



