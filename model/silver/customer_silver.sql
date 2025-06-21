with cte as (
    select 
        customer_id,
        first_name,
        last_name,
        email,
        country,
        row_number() over (partition by customer_id order by first_name) as rn
    from {{ ref('customer_src') }}
)

select 
    customer_id,
    first_name,
    last_name,
    email,
    country
from cte 
where rn = 1
