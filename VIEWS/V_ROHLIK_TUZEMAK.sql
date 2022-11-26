create or replace view V_ROHLIK_TUZEMAK(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as select 
*
from v_rohlik_stale_produkty
where "itemName" ilike '%Tuzemský%' or"itemName" ilike '%Tuzemák%' and "breadcrumbs" ilike '%Rumy%';