select 
    card_name,
    set_name,
    price,
    rank() over (partition by set_name order by price desc) as rank_price
from {{ ref('stg_public__cardingest') }}
where price is not null
order by rank_price, set_name