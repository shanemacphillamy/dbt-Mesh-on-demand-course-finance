with orders as (
    select * from {{ ref('dbt_training_shanem', 'fct_orders', v=2) }}
),

agg as (
    select
        ordered_at,
        location_name, 
        count(order_id) as order_count,
        sum(order_amount) as orders_revenue
    from orders 
    group by 1,2
)

select * from agg