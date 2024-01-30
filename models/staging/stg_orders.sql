{{ config(materialized='table') }}

with orders_data as
(
    select *
    from raw.jaffle_shop.orders
),

rename as (
    select id as order_id,
    user_id as customer_id,
    order_date,
    status
    from raw.jaffle_shop.orders
)

select * from rename 