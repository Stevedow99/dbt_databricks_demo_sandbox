{% macro test_macro() -%}

{#########################################################################}
{# checks what command was run, and does something different based on it #}
{#########################################################################}

    {% if flags.WHICH == 'compile' %}

        {{ log("dbt compile called therefore doing this command", info=True) }}

        {% do run_query("SELECT 1") %}

    {% elif flags.WHICH == 'run' %}

        {{ log("dbt run called therefore doing this command", info=True) }}

        {% do run_query("SELECT 2") %}

    {% else %}

        {{ log("compile or run was not called, not doing anything", info=True) }}


    {% endif %}

{%- endmacro %}