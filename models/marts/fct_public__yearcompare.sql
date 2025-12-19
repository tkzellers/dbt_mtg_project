select 
    year(f1.date_released),
    count(distinct f1.card_name) as cards_current_year_count,
    count(distinct f1.set_name) as sets_current_year_count,
    (count(distinct f1.set_name) - count(distinct f2.set_name))/count(distinct f2.set_name) as sets_pct_change,
    (count(distinct f1.card_name) - count(distinct f2.card_name))/count(distinct f2.card_name) as cards_pct_change
from {{ ref('stg_public__cardingest') }} f1
inner join
{{ ref('stg_public__cardingest') }} f2
on year(f1.date_released) - 1 = year(f2.date_released)
where 
    f1.set_type in ('commander', 'expansion', 'draft_innovation', 'masters')
    and f2.set_type in ('commander', 'expansion', 'draft_innovation', 'masters')
group by 1
order by cards_pct_change