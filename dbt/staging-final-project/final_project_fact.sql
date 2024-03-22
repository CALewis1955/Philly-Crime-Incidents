{{ config(materialized="view") }}

with crime_data as
    (select *,
        row_number() over(partition by cast(dc_key as numeric), dispatch_date_time) as rn
        FROM {{ ref("unioned_data_2006_2023") }}
    )

select
    -- identifiers
    {{ dbt_utils.generate_surrogate_key(["dc_key", "dispatch_date_time"]) }}
    as crime_id,
    objectid,
    {{ dbt.safe_cast("dc_key", api.Column.translate_type("integer")) }}
    as police_key,
    {{ dbt.safe_cast("dc_dist", api.Column.translate_type("integer")) }}
    as police_district,
    psa,

    -- timestamps
    cast(dispatch_date_time as timestamp) as dispatch_date_time,
    cast(dispatch_date as timestamp) as dispatch_date,
    cast(dispatch_time as timestamp) as dispatch_time,

    {{ dbt.safe_cast("hour", api.Column.translate_type("integer")) }} as hour,
    {{ dbt.safe_cast("day", api.Column.translate_type("string")) }}
    as day_of_week,
    {{ dbt.safe_cast("month", api.Column.translate_type("integer")) }} as month,
    {{ dbt.safe_cast("quarter", api.Column.translate_type("integer")) }}
    as quarter,

    -- crime type
    {{ dbt.safe_cast("ucr_general", api.Column.translate_type("integer")) }}
    as ucr_code,
    {{
        dbt.safe_cast(
            "text_general_code", api.Column.translate_type("string")
        )
    }} as crime_type,

    -- location
    {{ dbt.safe_cast("location_block", api.Column.translate_type("integer")) }}
    as location_block,
    cast(point_x as numeric) as point_x,
    cast(point_y as numeric) as point_y,
    cast(lat as numeric) as lat,
    cast(lng as numeric) as lng

from crime_data
--where rn = 1

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
--{% if var("is_test_run", default=true) %} limit 100 {% endif %}
