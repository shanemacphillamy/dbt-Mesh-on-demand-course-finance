with orders as (
    select * from {{ ref('dbt_training_shanem', 'fct_orders_v2')}}
),

agg as (
    select
        ordered_at,
        location_name, 
        count(order_id) as order_count,
        sum(order_total) as orders_revenue
    from orders 
    group by 1,2
)

select * from agg