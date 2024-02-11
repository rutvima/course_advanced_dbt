{{ config(materialized='table') }}

SELECT
    session_id,
    created_at,
    user_id,
    event_name,
    event_id, 
    {{
        rolling_aggregation_n_periods(
            column_name='event_id',
            partition_by='user_id',
            aggregation_type='count',
            time_periods=7,
            order_by='created_at'
        )
    }}

FROM {{ ref('stg_bingeflix__events') }}