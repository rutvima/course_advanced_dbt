# Macros Docs
This file contains doumentation for macros.

## rolling_aggregation_n_periods 
This section contains documentation for rolling_aggregation_n_periods macro.

{% docs macro__rolling_aggregation_n_periods %} This macro computes an aggregation function over a time period. 
The input parameters are:
column_name
partition by
aggregation_type
time_periods
order by
{% enddocs %}

{% docs macro__rolling_aggregation_n_periods_column_name %} The column you want to aggregate. Default column: event_id {% enddocs %}

{% docs macro__rolling_aggregation_n_periods_partition_by %} Name of the column that will be used to create the windows for the calculation. Default column: user_id {% enddocs %}

{% docs macro__rolling_aggregation_n_periods_aggregation_type %} Aggregating function to be applied to the "n" periods within a partition. It must be a valid sql aggregating function. Default function: avg {% enddocs %}

{% docs macro__rolling_aggregation_n_periods_time_periods %} Number of periods to take into account for the aggregation. Default value: 7 {% enddocs %}

{% docs macro__rolling_aggregation_n_periods_order_by %} Column to be used to sort the rows within a partition. Default column: created_at {% enddocs %}

## date_trunc
This section contains documentation for date_trunc macro.

{% docs macro__date_trunc %} This macro truncates your date or timestamp column to a specified trunc_option.. 
The input parameters are:
trunc_option
column_name
{% enddocs %}

{% docs macro__date_trunc_trunc_option %} The date or time part option (e.g., hour, day, month, etc.). Default value: month {% enddocs %}

{% docs macro__date_trunc_column_name %} The date/time column you want to truncate. Default column: created_at {% enddocs %}