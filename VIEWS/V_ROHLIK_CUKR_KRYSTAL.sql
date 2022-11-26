create or replace view V_ROHLIK_CUKR_KRYSTAL(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select
*
from v_rohlik_stale_produkty
where "itemName" ilike '%Cukr%' and "itemName" ilike '%Krystal%' 
or "itemName" ilike '%krystalový%' and "breadcrumbs" ilike '%Trvanlivé%';