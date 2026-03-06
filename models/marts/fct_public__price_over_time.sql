with prices as (

    select
        load_date,
        card_name,
        price
    from {{ ref('int_public__cardingest') }}

)

select * from prices