{% macro word_count(column_name) %}
    array_size(split({{ column_name }}, ' '))
{% endmacro %}