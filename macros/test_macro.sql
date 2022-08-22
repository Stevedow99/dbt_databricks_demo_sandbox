{% macro test_macro() -%}

        {% do run_query("SELECT 1") %}

    {% else %}

         {% do run_query("SELECT 2") %}

    {% endif %}

{%- endmacro %}