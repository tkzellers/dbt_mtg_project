select 
    set_name,
    set_type,
    date_released,
    count(distinct card_name) as card_count,
    count(distinct artist) as artist_count,
    round(sum(price), 1) as est_price,
    max(price) as max_price,
    p.card_name as max_price_card
from {{ ref('stg_public__cardingest') }}
left join
{{ ref('dim_public__most_expensive_cards') }} as p
using(set_name)
where set_type in ('commander', 'expansion', 'draft_innovation', 'core') and p.rank_price = 1
group by 1,2,3,8
order by 3