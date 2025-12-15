
select 
    raw_card_json:name:: string as card_name,
    raw_card_json:oracle_text:: string as card_text,
    raw_card_json:flavor_text:: string as flavor_text,
    -- array_size(split(raw_card_json:oracle_text, ' ')) as word_count,
    raw_card_json:set_name:: string as set_name,
    raw_card_json:set_type:: string as set_type,
    raw_card_json:rarity:: string as rarity,
    raw_card_json:cmc:: string as mana_value,
    raw_card_json:color_identity:: array as color_list,
    raw_card_json:type_line:: string as card_type,
    raw_card_json:prices:usd as price1,
    raw_card_json:prices:usd_foil as price2,
    coalesce(raw_card_json:prices:usd:: float, raw_card_json:prices:usd_foil:: float) as price,
    raw_card_json:reprint::boolean as reprint,
    raw_card_json:artist:: string as artist,
    raw_card_json:frame_effects:: array as frame_effects,
    raw_card_json:released_at:: date as date_released,
    raw_card_json:scryfall_uri::string as uri
from {{ source('public', 'card_ingest') }}
where contains(raw_card_json:name, '//') = FALSE