{#########################################################################}
{# checks if the provided table exists, if it does then it truncates it #}
{#########################################################################}


{% macro truncate_table_if_exists() -%}

    {###########################################################################}
    {# setting the query that will check if the table exists in the warehouse #}
    {###########################################################################}

    {% set if_table_exists_query %}
    

        Select count(*) from INFORMATION_SCHEMA.TABLES where table_schema = '{{ this.schema }}' AND table_name = '{{ this.table }}'

    {% endset %}

    {#########################################################################}     
    {# getting the results of that query #}
    {#########################################################################} 

    {% if execute %}

        {% set returned_results = run_query(if_table_exists_query).columns[0].values()[0] %}

        {% set did_command_execute = "coommand did execute" %}

    {% else %}

        {% set returned_results = 0 %}

        {% set did_command_execute = "coommand did not execute" %}

    {% endif %}

    {#########################################################################}
    {# if the object exists then we truncate it, if not we do nothing #}
    {#########################################################################}

    {% if returned_results >= 1 %}

        {{ log("Table exists, therefore truncating it" ~ if_table_exists_query ~ returned_results ~ did_command_execute, info=True) }}

         {% set trunc_table_query %}

            TRUNCATE TABLE {{ this.schema }}.{{ this.table }} 

        {% endset %}

        {% do run_query(trunc_table_query) %}

    {% else %}

         {{ log("Table does not exists, no action needed" ~ if_table_exists_query ~ returned_results ~ did_command_execute, info=True) }}
    
    {% endif %}

{%- endmacro %}
