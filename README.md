# Welcome to the Bingeflix Data Team

### WEEK 4: task 2
- Top 5 costliest dbt queries you've run in the last 30 days

```sql
with max_date as 
( select max(date(end_time)) as date 
  from dev.DBT_RUTVIMAGMAILCOM.dbt_queries 
) 

select dbt_queries.dbt_node_id
, sum(dbt_queries.query_cost) as total_cost_last_30d
, total_cost_last_30d*12 as estimated_annual_cost 
from dev.DBT_RUTVIMAGMAILCOM.dbt_queries 
cross join max_date 
where dbt_queries.start_time >= dateadd('day', -30, max_date.date) 
and dbt_queries.start_time < max_date.date -- don't include partial day of data 
group by 1 
order by total_cost_last_30d desc 
limit 5;
```

- daily cost of running your most expensive dbt model

```sql
with
max_date as (
    select max(date(end_time)) as date
    from dev.DBT_RUTVIMAGMAILCOM.dbt_queries 
)
, final as (
    select
    dbt_queries.dbt_node_id,
    sum(dbt_queries.query_cost) as total_cost_last_30d,
    total_cost_last_30d*12 as estimated_annual_cost
from dev.DBT_RUTVIMAGMAILCOM.dbt_queries 
cross join max_date
where
    dbt_queries.start_time >= dateadd('day', -30, max_date.date)
    and dbt_queries.start_time < max_date.date -- don't include partial day of data    
    and dbt_node_id is not null
group by 1
order by total_cost_last_30d desc
limit 1
)
select
    date(start_time) as date,
    sum(query_cost) as cost
from dev.DBT_RUTVIMAGMAILCOM.dbt_queries 
where dbt_node_id in (select dbt_node_id from final)
group by 1
order by 1 desc
```


### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)


### Testing Conventions
#### Sources
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.