select * 
from {{ ref('stg_public__cardingest_sfc') }}
union all
select * 
from {{ ref('stg_public__cardingest_dfc') }}

    