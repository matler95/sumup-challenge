{% macro timestamp_format(col, fmt='%Y-%m-%d %H:%M:%S') %}
strftime(
    timestamp '1899-12-30 00:00:00' + (CAST({{ col }} AS DOUBLE) * INTERVAL '1 day'),
    '{{ fmt }}'
)
{% endmacro %}
