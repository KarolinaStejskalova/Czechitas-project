create or replace view V_ROHLIK_SUNKA(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from V_ROHLIK_STALE_PRODUKTY
where "itemName" ilike '%šunka%' and "itemName" ilike '%vepřová%';