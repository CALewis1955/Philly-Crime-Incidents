{#
    This macro returns whether the offense is a serious, Part I crime.   
#}

{% macro is_serious_offense(ucr_general) -%}

    case {{ dbt.safe_cast("ucr_general", api.Column.translate_type("integer")) }}  
        when ucr_general < 800 then 'Y'
        else 'N'
    end

{%- endmacro %}