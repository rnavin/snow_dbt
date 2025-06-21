select
country,
count(customer_id) as customer_cnt
from {{ ref('customer_silver') }}
group by country