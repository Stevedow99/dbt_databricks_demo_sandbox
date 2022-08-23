{{
config(  pre_hook = test_macro()) 
}}

select
    date_trunc('MM', order_date) as order_month,
    sum(gross_item_sales_amount) as gross_revenue

from {{ ref('fct_order_items') }}
    group by 
        order_month
    order by 
        order_month

-- some comments for testing