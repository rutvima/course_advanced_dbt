{% macro date_trunc(trunc_option='month', column_name='created_at') %}
    DATE( DATE_TRUNC( {{ trunc_option }}, {{ column_name }} ))
{% endmacro %}