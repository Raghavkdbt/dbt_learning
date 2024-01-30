/* {{ config(materialized='table') }} */

{{ config(materialized='table') }}

with customers_data as
(
    select id as customer_id,
    First_name,
    Last_Name
    from raw.jaffle_shop.customers
)

select * from customers_data