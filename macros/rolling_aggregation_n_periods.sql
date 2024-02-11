{% macro rolling_aggregation_n_periods(column_name='event_id', partition_by='user_id', aggregation_type='avg', time_periods=7, order_by='created_at') %}
    {{ aggregation_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_periods }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregation_type }}_{{ time_periods }}_periods_{{ column_name }}
{% endmacro %}