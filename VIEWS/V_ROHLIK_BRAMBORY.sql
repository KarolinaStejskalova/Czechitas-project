create or replace view V_ROHLIK_BRAMBORY(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from v_rohlik_stale_produkty
where "itemName" ilike '%brambory%' 
and "itemName" ilike '%konzumní%' 
and "itemName" not like '%krájené%'
and "itemName" not like '%loupané%' 
and "itemName" not like '%Grenaille';