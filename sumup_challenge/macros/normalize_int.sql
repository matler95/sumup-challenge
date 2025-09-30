{% macro normalize_int(col) %}
REGEXP_REPLACE({{ col }}, '^[a-zA-Z]', '')
{% endmacro %}