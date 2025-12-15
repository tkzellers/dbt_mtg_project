select
card_name,
array_size(split(card_text, ' ')),
card_text,
uri
from {{ ref('stg_public__cardingest') }}