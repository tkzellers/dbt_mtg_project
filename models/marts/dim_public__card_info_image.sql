with cards as (
    select 
        *   
    from {{ ref('int_public__cardingest') }}
    where load_date = (select max(load_date) from {{ ref('int_public__cardingest') }})
)

select * from cards

