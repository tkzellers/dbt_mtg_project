--count cards of each rarity type for each set, rows are sets, columns are rarities

{% set rarities_query %}
    select distinct rarity
    from {{ ref('stg_public__cardingest') }}
{% endset %}

{% set rows = run_query(rarities_query) %}

{% if execute %}
    {% set rarities = rows.columns[0].values() %}
{% else %}
{% set rarities = [] %}
{% endif %}

select set_name,
    {% for r in rarities  %}
        count(case when rarity = '{{ r }}' then card_name else null end) as {{ r }}

        {% if not loop.last %}
            ,
        {% endif %}

    {% endfor %}

from {{ ref('stg_public__cardingest') }}
where set_type in ('commander', 'expansion', 'masters', 'draft_innovation')
group by 1

