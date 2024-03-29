with store_final as 
(
select *
from {{ ref('store') }}
),
store_sales_final as
(
select *
from {{ ref('store_sales') }}
),
Final_Sales_profit as
(
select S_STORE_NAME,S_COUNTY,sum(SS_SALES_PRICE),sum(SS_NET_PROFIT) from store_final,store_sales_final
where S_STORE_SK=SS_STORE_SK
group by 1,2
)
select * from Final_Sales_profit