select
card_name,
{{ word_count("card_text") }} as word_count,
card_text,
uri
from {{ ref('stg_public__cardingest') }}