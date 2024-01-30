{{ config(materialized='table') }}

with customers as(
    select * from {{ ref('stg_customers') }}
),
orders as 
(
   select * from {{ ref('stg_orders') }} 
),
customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1

),

final as (

    select
        s.customer_id,
        s.first_name,
        s.last_name,
        cs.first_order_date,
        cs.most_recent_order_date,
        coalesce(cs.number_of_orders, 0) as number_of_orders

    from customers s

    left join customer_orders cs using (customer_id)

)

select * from final