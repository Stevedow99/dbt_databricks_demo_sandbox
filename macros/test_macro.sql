{% macro test_macro() -%}

    {% do run_query("SELECT 1") %}

{%- endmacro %}